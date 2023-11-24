import 'package:e_commerce_app/domain/domain_entities/Auth_Result_Entity.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {
  String? loadingMessage;

  RegisterLoadingState({required this.loadingMessage});
}

class RegisterErrorState extends RegisterStates {
  String errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterStates {
  AuthResultEntity response;

  RegisterSuccessState({required this.response});
}
