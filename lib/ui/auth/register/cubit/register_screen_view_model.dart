import 'package:e_commerce_app/ui/auth/register/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/useCases/register_use_case.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  //hold data-handle logic
  var passwordController = TextEditingController(text: '123456');
  var emailController = TextEditingController(text: "adham13@route.com");
  var nameController = TextEditingController(text: 'adham');
  var ConfirmPasswordController = TextEditingController(text: '123456');
  var mobileController = TextEditingController(text: '01234545412');
  final formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState(loadingMessage: 'Loading...'));
    }
    var either = await registerUseCase.invoke(
        nameController.text,
        passwordController.text,
        emailController.text,
        ConfirmPasswordController.text,
        mobileController.text);
    either.fold((l) {
      emit(RegisterErrorState(errorMessage: l.errorMessage ?? ""));
    }, (response) {
      emit(RegisterSuccessState(response: response));
    });
  }
}
