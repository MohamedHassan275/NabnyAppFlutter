import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/model/login_user_model.dart';
import 'package:nabny/model/logout_user_model.dart';
import 'package:nabny/repositries/repositries_status.dart';

import '../../model/check_mobile_user_model.dart';

class MyServiceApi {
  static String URL = 'https://nebny.net/api/v2/';

  static Future<LoginUserModel?> checkLoginUser(
      String phone, String password, String fcmToken) async {
    LoginUserModel? loginUserModel;
    var fromData = FormData.fromMap({
      'phone': phone,
      'password': password,
      'fcm_token': fcmToken,
    });
    try {
      Response response = await Dio().post(URL + 'login', data: fromData);

      if (response.statusCode == 200) {
        return LoginUserModel.fromJson(response.data);
      } else {
        print('${response.statusMessage} : ${response.statusCode}');
       return throw Exception(response.statusMessage!);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return loginUserModel;
  }

  static Future<CheckMobileUserModel?> CreateAccountUserByMobile(String phone) async {
    CheckMobileUserModel? checkMobileUserModel;
    var fromData = FormData.fromMap({
      'phone': phone,
    });
    try {
      Response response =
          await Dio().post(URL + 'step1/register', data: fromData);

      if (response.statusCode == 200) {
        return CheckMobileUserModel.fromJson(response.data);
      } else {
        print('${response.statusMessage} : ${response.statusCode}');
      return throw Exception(response.statusMessage!);
        // return Failure(errorResponse: 'can`t have data');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return checkMobileUserModel;
  }

  static Future<CheckMobileUserModel?> activeCodeByRegister(String phone, String code) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'phone': phone,
      'code': code,
    });
    try {
      Response response =
      await Dio().post(URL + 'register/code', data: fromData);

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return CheckMobileUserModel.fromJson(response.data);
      } else {
        // print('${response.statusMessage} : ${response.statusCode}');
        return throw Exception(response.statusMessage!);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return checkMobileModel;
  }

  static Future<Object> CreateAccountByDetailUser(
      String phone, String firstname,
      String lastname, String email,
      String password, String fcmToken) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'phone': phone,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
    });
    try {
      Response response =
          await Dio().post(URL + 'step2/register', data: fromData);

      if (response.statusCode == 200) {
        return SUCCESS(response: CheckMobileUserModel.fromJson(response.data));
      } else {
        print('${response.statusMessage} : ${response.statusCode}');
        throw response.statusMessage!;
        // return Failure(errorResponse: 'can`t have data');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return checkMobileModel != null;
  }

  static Future<LogoutUserModel?> LogoutUser(String Authorization) async {
    LogoutUserModel? logoutUserModel;
    try {
      Response response =
      await Dio().get(URL + 'logout', options: Options(
        headers: {
          'Authorization': 'Bearer $Authorization'
        }
      ));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return LogoutUserModel.fromJson(response.data);
      } else {
        // print('${response.statusMessage} : ${response.statusCode}');
        return throw Exception(response.statusMessage!);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('DATA: ${e.response?.statusMessage}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return logoutUserModel;
  }

  static Future<CheckMobileUserModel?> checkMobileByForgetPassword(String phone) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'phone': phone,
    });
    try {
      Response response =
          await Dio().post(URL + 'forgetpassword', data: fromData);

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return CheckMobileUserModel.fromJson(response.data);
      } else {
        // print('${response.statusMessage} : ${response.statusCode}');
        // throw response.statusMessage!;
        return  throw Exception('can`t have data');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return checkMobileModel;
  }

  static Future<CheckMobileUserModel?> activeCodeByForgetPassword(
      String phone, String code) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'phone': phone,
      'code': code,
    });
    try {
      Response response = await Dio().post(URL + 'activcode', data: fromData);

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return CheckMobileUserModel.fromJson(response.data);
      } else {
        // print('${response.statusMessage} : ${response.statusCode}');
        return throw Exception(response.statusMessage!);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return checkMobileModel;
  }

  static Future<CheckMobileUserModel?> ReChangePasswordUser(
      String phone, String password) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'phone': phone,
      'password': password,
    });
    try {
      Response response = await Dio().post(URL + 'rechangepass', data: fromData);

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return CheckMobileUserModel.fromJson(response.data);
      } else {
        // print('${response.statusMessage} : ${response.statusCode}');
        return throw  Exception(response.statusMessage!);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return checkMobileModel;
  }

}
