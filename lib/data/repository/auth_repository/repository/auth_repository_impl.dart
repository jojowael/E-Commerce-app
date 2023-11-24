import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/repository/auth_repository/dataSource/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/DataSource/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../../../domain/domain_entities/Auth_Result_Entity.dart';
import '../../../Api/base_error.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  //m7taga object mn al data source 3alashan tshta8al
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String password, String email, String rePassword, String phone) {
    return remoteDataSource.register(name, password, email, rePassword, phone);
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password) {
    return remoteDataSource.login(email, password);
  }
}

AuthRepositoryContract injectAuthRepository() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
