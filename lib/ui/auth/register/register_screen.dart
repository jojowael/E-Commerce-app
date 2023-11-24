import 'package:e_commerce_app/domain/useCases/register_use_case.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/states.dart';
import 'package:e_commerce_app/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_colors.dart';
import '../../../utils/text_field_item.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(context, state.loadingMessage ?? 'waiting');
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.errorMessage!,
                posActionName: 'ok', title: 'Error');
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context, state.response.userEntity?.name ?? "",
                posActionName: 'ok', title: 'Success');
          }
        },
        child: Scaffold(
          body: Container(
            color: Theme.of(context).primaryColor,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 85.h, bottom: 71.1.h, left: 97.w, right: 97.w),
                    child: Image.asset('assets/images/img.png'),
                  ),
                  Form(
                    key: viewModel.formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldItem(
                        fieldName: 'Full Name',
                        hintText: 'enter your name',
                        controller: viewModel.nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'please enter name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldItem(
                      fieldName: 'E-mail address',
                      hintText: 'enter your email address',
                      controller: viewModel.emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your email address';
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldItem(
                      fieldName: 'password',
                      hintText: 'enter your password',
                      controller: viewModel.passwordController,
                      validator: (value) {
                        if (value == null || value.trim()!.isEmpty) {
                          return 'please enter password';
                        }
                        if (value.trim()!.length < 6 ||
                            value.trim()!.length > 30) {
                          return 'password should be >6 &<30';
                        }
                        return null;
                      },
                      isObsecure: viewModel.isObsecure,
                      suffixIcon: InkWell(
                        child: viewModel.isObsecure
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onTap: () {
                          if (viewModel.isObsecure) {
                            viewModel.isObsecure = false;
                          } else {
                            viewModel.isObsecure = true;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldItem(
                      fieldName: 'Confirmation Password',
                      hintText: 'enter your confirmation password',
                      controller: viewModel.ConfirmPasswordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter password';
                        }
                        if (value.trim()!.length < 6 ||
                            value.trim()!.length > 30) {
                          return 'password should be >6 &<30';
                        }
                        return null;
                      },
                      isObsecure: viewModel.isObsecure,
                      suffixIcon: InkWell(
                        child: viewModel.isObsecure
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onTap: () {
                          if (viewModel.isObsecure) {
                            viewModel.isObsecure = false;
                          } else {
                            viewModel.isObsecure = true;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldItem(
                      fieldName: 'Mobile Number',
                      hintText: 'enter your mobile no',
                      controller: viewModel.mobileController,
                      KeyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your mob';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: ElevatedButton(
                      child: Container(
                        height: 64.h,
                        width: 398.w,
                        child: Center(
                          child: Text(
                            'Sign up',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.sp),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                      onPressed: () {
                        viewModel.register();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
