import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/Api/api_constatnts.dart';
import 'package:e_commerce_app/data/Api/base_error.dart';
import 'package:e_commerce_app/data/model/request/LoginRequest.dart';
import 'package:e_commerce_app/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_app/data/model/response/LoginResponse.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  //singleton pattern
//private constructor
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<BaseError, RegisterResponse>> register(String name,
      String password, String email, String rePassword, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
/*https://ecommerce.routemisr.com/api/v1/auth/signup*/
      Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.registerApi);
      var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
      var response = await http.post(url, body: requestBody.toJson());
      var registerResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      //response momkn ykoun success or fail
      //range 200 lai 300 7alet success
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(BaseError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      //left base Error
      //no internet connection fa sa3tha haraga3 error
      return Left(BaseError(errorMessage: 'Please Check Internet Connection'));
    }
  }

  Future<Either<BaseError, LoginResponse>> login(
      String password, String email) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
/*https://ecommerce.routemisr.com/api/v1/auth/signup*/
      Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.LoginApi);
      var requestBody = LoginRequest(
        email: email,
        password: password,
      );
      var response = await http.post(url, body: requestBody.toJson());
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      //response momkn ykoun success or fail
      //range 200 lai 300 7alet success
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(BaseError(errorMessage: loginResponse.message));
      }
    } else {
      //left base Error
      //no internet connection fa sa3tha haraga3 error
      return Left(BaseError(errorMessage: 'Please Check Internet Connection'));
    }
  }
}
