import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/domain/domain_entities/Auth_Result_Entity.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../data/Api/base_error.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  //function register ya3ni agib al data ya3ni lazm object mn al repository
  Future<Either<BaseError, AuthResultEntity>> invoke(String name,
      String password, String email, String rePassword, String phone) async {
    var either = await repositoryContract.register(
        name, password, email, rePassword, phone);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepository());
}
