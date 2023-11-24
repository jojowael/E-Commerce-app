import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/Api/base_error.dart';
import 'package:e_commerce_app/domain/domain_entities/Auth_Result_Entity.dart';

//abstract class of data source
abstract class AuthRemoteDataSource {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String password, String email, String rePassword, String phone);

  //login
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password);
}
