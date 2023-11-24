import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/domain_entities/Auth_Result_Entity.dart';

import '../../../../data/Api/base_error.dart';

abstract class AuthRepositoryContract {
  //3andaha function t3m;i login wai al tania t3ml register
  //method register
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String password, String email, String rePassword, String phone);

  //method login
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password);
}
