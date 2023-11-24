import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../data/Api/base_error.dart';
import '../domain_entities/Auth_Result_Entity.dart';

class LoginUseCase {
  //3ayz a5od al email wai al pass 3ashan ab3ato lail api
  //object mn al repository
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

//method login
  Future<Either<BaseError, AuthResultEntity>> invoke(
      String email, String password) async {
    var either = await repositoryContract.login(email, password);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepository());
}
