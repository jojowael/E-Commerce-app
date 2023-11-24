import 'package:e_commerce_app/ui/auth/Login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/useCases/login_use_case.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

//hold data-handle logic
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      //login
      emit(LoginLoadingState(loadingMessage: 'Loading...'));
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    }
  }
}
