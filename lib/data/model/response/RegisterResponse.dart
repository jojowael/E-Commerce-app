import 'package:e_commerce_app/data/model/response/Errors.dart';
import 'package:e_commerce_app/data/model/response/userDto.dart';
import 'package:e_commerce_app/domain/domain_entities/Auth_Result_Entity.dart';

/// message : "success"
/// user : {"name":"Juliana Wael Shawky","email":"julianawael@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NTE4MGFlYmJiZTYzN2RlNWNiMjNmMiIsIm5hbWUiOiJKdWxpYW5hIFdhZWwgU2hhd2t5Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE2OTk4NDAxNzUsImV4cCI6MTcwNzYxNjE3NX0.8yhJvlCU7B58o7iRVr2pbhubFQA9tA33mVhYkW4Cy3g"

class RegisterResponse {
  RegisterResponse({
    this.message,
    this.user,
    this.error,
    this.statusMsg,
    this.token,
  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error = json['errors'] != null ? ErrorJojo.fromJson(json['errors']) : null;
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  ErrorJojo? error;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['errors'] = error;
    map['statusMsg'] = statusMsg;

    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }
}

/// name : "Juliana Wael Shawky"
/// email : "julianawael@gmail.com"
/// role : "user"
