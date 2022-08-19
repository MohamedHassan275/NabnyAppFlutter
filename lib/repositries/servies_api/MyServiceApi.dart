import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/model/LocationModel.dart';
import 'package:nabny/model/OfferOrderRequestModel.dart';
import 'package:nabny/model/home_user_model.dart';
import 'package:nabny/model/login_user_model.dart';
import 'package:nabny/model/logout_user_model.dart';
import 'package:nabny/model/my_current_order_model.dart';
import 'package:nabny/model/my_new_order_model.dart';
import 'package:nabny/model/my_previous_order_model.dart';
import 'package:nabny/model/response_user_model.dart';
import 'package:nabny/model/setting_model.dart';
import 'package:nabny/repositries/repositries_status.dart';

import '../../model/check_mobile_user_model.dart';
import '../../model/companiesModel.dart';
import '../../model/favouriteModel.dart';
import '../../model/my_send_order_model.dart';
import '../../model/profile_user_model.dart';

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
      Response response = await Dio().post(URL + 'login', data: fromData,options: Options(
        receiveTimeout: 10000,
        sendTimeout: 10000
      ));

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

  static Future<CheckMobileUserModel?> CreateAccountUserByMobile(
      String phone) async {
    CheckMobileUserModel? checkMobileUserModel;
    var fromData = FormData.fromMap({
      'phone': phone,
    });
    try {
      Response response =
          await Dio().post(URL + 'step1/register', data: fromData,options: Options(
              receiveTimeout: 10000,
              sendTimeout: 10000
          ));

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

  static Future<CheckMobileUserModel?> activeCodeByRegister(
      String phone, String code) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'phone': phone,
      'code': code,
    });
    try {
      Response response =
          await Dio().post(URL + 'register/code', data: fromData,options: Options(
            receiveTimeout: 10000,sendTimeout: 10000
          ));

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

  static Future<LoginUserModel?> createAccountByDetailUser(
      String phone,
      String firstname,
      String lastname,
      String email,
      String password,
      String fcmToken) async {
    LoginUserModel? loginUserModel;
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
          await Dio().post(URL + 'step2/register', data: fromData,options: Options(
              receiveTimeout: 10000,
              sendTimeout: 10000
          ));

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
        print('statusMessage: ${e.response?.statusMessage}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return loginUserModel;
  }

  static Future<LogoutUserModel?> LogoutUser(String Authorization) async {
    LogoutUserModel? logoutUserModel;
    try {
      Response response = await Dio().get(URL + 'logout',
          options:
              Options(headers: {'Authorization': 'Bearer $Authorization'},sendTimeout: 10000,receiveTimeout: 10000));

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

  static Future<SettingModel?> GetSettingUser(String Authorization) async {
    SettingModel? settingModel;
    try {
      Response response = await Dio().get(URL + 'setting',
          options:
              Options(headers: {'Authorization': 'Bearer $Authorization'},receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return SettingModel.fromJson(response.data);
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
    return settingModel;
  }

  static Future<ProfileUserModel?> checkProfileDetails(
      String Authorization) async {
    ProfileUserModel? profileUserModel;
    try {
      Response response = await Dio().get(URL + 'profile',
          options:
              Options(headers: {'Authorization': 'Bearer $Authorization'},sendTimeout: 10000,receiveTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return ProfileUserModel.fromJson(response.data);
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
    return profileUserModel;
  }

  static Future<HomeUserModel?> checkHomeDetailsUser(
      String Authorization, String Language) async {
    HomeUserModel? homeUserModel;
    // var formData = FormData.fromMap({
    //   'lat' : lat,
    //   'lng' : lng,
    // });
    try {
      Response response = await Dio().post(URL + 'home',
          options: Options(sendTimeout: 10000, receiveTimeout: 10000, headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          }));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return HomeUserModel.fromJson(response.data);
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
    return homeUserModel;
  }

  static Future<ResponseUserModel?> AddOfferOrderRequest(
      String Authorization,
      String Language,
      String companyId,
      String casting_type,
      String execution_date,
      String qty_m,
      String mix_type,
      String cement_type,
      String stone_size,
      String special_description,
      String address,
      String with_pump,
      String pump_length,
      String with_snow,
      String with_lab) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'company': companyId,
      'casting_type': casting_type,
      'execution_date': execution_date,
      'qty_m': qty_m,
      'mix_type': mix_type,
      'cement_type': cement_type,
      'stone_size': stone_size,
      'special_description': special_description,
      'address': address,
      'with_pump': with_pump,
      'pump_length': pump_length,
      'with_snow': with_snow,
      'with_lab': with_lab,
    });
    try {
      Response response = await Dio().post(URL + 'order/add',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
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
    return responseUserModel;
  }

  static Future<ResponseUserModel?> AcceptOfferOrderRequest(
      String Authorization,
      String Language,
      String order_id,
      String request_id) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'order_id': order_id,
      'request_id': request_id,
    });
    try {
      Response response = await Dio().post(URL + 'order/accept',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },sendTimeout: 10000,receiveTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
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
    return responseUserModel;
  }

  static Future<ResponseUserModel?> CancelOfferOrderRequest(
      String Authorization, String Language, String order_id) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'order_id': order_id,
    });
    try {
      Response response = await Dio().post(URL + 'order/cancel',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
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
    return responseUserModel;
  }

  static Future<ResponseUserModel?> ReceivedOfferOrderRequest(
      String Authorization, String Language, String order_id) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'order_id': order_id,
    });
    try {
      Response response = await Dio().post(URL + 'order/received',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },sendTimeout: 10000,receiveTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
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
    return responseUserModel;
  }

  static Future<OfferOrderRequestModel?> GetRequestOfferPrice(
      String Authorization, String Language) async {
    OfferOrderRequestModel? offerOrderRequestModel;
    // var formData = FormData.fromMap({
    //   'lat' : lat,
    //   'lng' : lng,
    // });
    try {
      Response response = await Dio().post(URL + 'price_offers',
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return OfferOrderRequestModel.fromJson(response.data);
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
    return offerOrderRequestModel;
  }

  static Future<FavouriteModel?> GetFavoriteUser(
      String Authorization, String Language) async {
    FavouriteModel? favouriteModel;
    // var formData = FormData.fromMap({
    //   'lat' : lat,
    //   'lng' : lng,
    // });
    try {
      Response response = await Dio().get(URL + 'favourites',
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },sendTimeout: 10000,receiveTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return FavouriteModel.fromJson(response.data);
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
    return favouriteModel;
  }

  static Future<MyNewOrderModel?> GetNewMyOrderUser(
      String Authorization, String Language) async {
    MyNewOrderModel? myNewOrderModel;
    try {
      Response response = await Dio().get(URL + 'orders',
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return MyNewOrderModel.fromJson(response.data);
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
    return myNewOrderModel;
  }

  static Future<MySendOrderModel?> GetMySendOrderUser(
      String Authorization, String Language) async {
    MySendOrderModel? mySendOrderModel;
    try {
      Response response = await Dio().get(URL + 'sentorders',
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },sendTimeout: 10000,receiveTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return MySendOrderModel.fromJson(response.data);
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
    return mySendOrderModel;
  }

  static Future<MyCurrentOrderModel?> GetMyCurrentOrderUser(
      String Authorization, String Language) async {
    MyCurrentOrderModel? myCurrentOrderModel;
    try {
      Response response = await Dio().get(URL + 'currentorders',
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return MyCurrentOrderModel.fromJson(response.data);
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
    return myCurrentOrderModel;
  }

  static Future<MyPreviousOrderModel?> GetMyPreviousOrderUser(
      String Authorization, String Language) async {
    MyPreviousOrderModel? myPreviousOrderModel;
    try {
      Response response = await Dio().get(URL + 'previousorders',
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return MyPreviousOrderModel.fromJson(response.data);
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
    return myPreviousOrderModel;
  }

  static Future<ResponseUserModel?> AddFavoriteUser(
      String Authorization, String Language, String companyId) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'company_id': companyId,
    });
    try {
      Response response = await Dio().post(URL + 'favourites/add',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
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
    return responseUserModel;
  }

  static Future<ResponseUserModel?> RemoveFavoriteUser(
      String Authorization, String Language, String favouriteId) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'favourite_id': favouriteId,
    });
    try {
      Response response = await Dio().post(URL + 'favourites/remove',
          data: formData,
          options: Options(receiveTimeout: 10000, sendTimeout: 10000, headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          }));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
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
    return responseUserModel;
  }

  static Future<LocationModel?> GetLocationUser(
      String Authorization, String Language) async {
    LocationModel? locationModel;
    // var formData = FormData.fromMap({
    //   'lat' : lat,
    //   'lng' : lng,
    // });
    try {
      Response response = await Dio().get(URL + 'location',
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return LocationModel.fromJson(response.data);
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
    return locationModel;
  }

  static Future<ResponseUserModel?> AddLocationUser(String Authorization,
      double lat, double lng, String myLocationAr, String myLocationEn) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'lat': lat,
      'lng': lng,
      'address_ar': myLocationAr,
      'address_en': myLocationEn,
    });
    try {
      Response response = await Dio().post(URL + 'location/add',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            // 'Accept-Language' : '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
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
    return responseUserModel;
  }

  static Future<CompaniesModel?> GetCompaniesDetails(
      String Authorization, String Language, String category) async {
    CompaniesModel? companiesModel;
    var formData = FormData.fromMap({
      'category': category,
    });
    try {
      Response response = await Dio().post(URL + 'companies',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return CompaniesModel.fromJson(response.data);
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
    return companiesModel;
  }

  static Future<ResponseUserModel?> updateMyLocationInMap(String Authorization,
      String Language, double lat, double lng, String myLocation) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'lat': lat,
      'lng': lng,
      'address': myLocation,
    });
    try {
      Response response = await Dio().post(URL + 'update_user_location',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language': '$Language'
          },receiveTimeout: 10000,sendTimeout: 10000));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return ResponseUserModel.fromJson(response.data);
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
    return responseUserModel;
  }

  static Future<CheckMobileUserModel?> checkMobileByForgetPassword(
      String phone) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'phone': phone,
    });
    try {
      Response response =
          await Dio().post(URL + 'forgetpassword', data: fromData,options: Options(
            sendTimeout: 10000,
            receiveTimeout: 10000
          ));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return CheckMobileUserModel.fromJson(response.data);
      } else {
        // print('${response.statusMessage} : ${response.statusCode}');
        // throw response.statusMessage!;
        return throw Exception('can`t have data');
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
      Response response = await Dio().post(URL + 'activcode', data: fromData,options: Options(
        receiveTimeout: 10000,
        sendTimeout: 10000
      ));

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

  static Future<CheckMobileUserModel?> updateProfileUser(String firstname,
      String lastname, String Authorization, String email, String image) async {
    CheckMobileUserModel? checkMobileModel;
   // String fileName = image.path.split('/').last;

    var fromData = FormData.fromMap({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      "image": image
     // "image": await MultipartFile.fromFile(image.path, filename:fileName)
    });

    try {
      Response response = await Dio().post(URL + 'updateprofile',
          data: fromData,
          options: Options(headers: {'Authorization': 'Bearer $Authorization'},receiveTimeout: 10000,sendTimeout: 10000));

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

  static Future<CheckMobileUserModel?> changPasswordUser(
      String Authorization, String password, String old_password) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'old_password': old_password,
      'password': password,
    });
    try {
      Response response = await Dio().post(URL + 'changepassword',
          data: fromData,
          options:
              Options(headers: {'Authorization': 'Bearer $Authorization'},receiveTimeout: 10000,sendTimeout: 10000));

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
      Response response =
          await Dio().post(URL + 'rechangepass', data: fromData,options: Options(
            sendTimeout: 10000,
            receiveTimeout: 10000
          ));

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
}
