import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/Api/api_manager.dart';
import 'package:e_commerce_app/data/Api/base_error.dart';
import 'package:e_commerce_app/domain/domain_entities/Auth_Result_Entity.dart';
import 'package:e_commerce_app/domain/repository/auth_repository/DataSource/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  //3alashan al authremotedatasource dih tshta8al m7taga object mn apiManager
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String password, String email, String rePassword, String phone) async {
    var either = await apiManager.register(name, password, email, rePassword,
        phone); //either shayli ya error ya response
    return either.fold((l) {
      //left
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(password, email);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
