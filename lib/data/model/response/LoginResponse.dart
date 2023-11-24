import 'package:e_commerce_app/data/model/response/userDto.dart';
import 'package:e_commerce_app/domain/domain_entities/Auth_Result_Entity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti12@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZGQ2OTZjMTExYzAyYTY3ODE3NTIyOCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAwNzg1Mzg4LCJleHAiOjE3MDg1NjEzODh9.rqrNMFBzl_jqDUF9mRQXUtUVdixlEQ5ATnpncVaK-9c"

class LoginResponse {
  LoginResponse({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(userEntity: user?.toUserEntity(), token: token);
  }
}
