import 'package:e_commerce_app/domain/domain_entities/userEntity.dart';

class AuthResultEntity {
  UserEntity? userEntity;
  String? token;

  AuthResultEntity({this.userEntity, this.token});
}
