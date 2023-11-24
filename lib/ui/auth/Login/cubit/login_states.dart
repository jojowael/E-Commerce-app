import 'package:e_commerce_app/domain/domain_entities/Auth_Result_Entity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {
  String? loadingMessage;

  LoginLoadingState({this.loadingMessage});
}

class LoginErrorState extends LoginStates {
  String? errorMessage;

  LoginErrorState({this.errorMessage});
}

class LoginSuccessState extends LoginStates {
  //response
  AuthResultEntity response;

  LoginSuccessState({required this.response});
}
