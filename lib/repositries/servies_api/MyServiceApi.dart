import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/model/LocationModel.dart';
import 'package:nabny/model/home_user_model.dart';
import 'package:nabny/model/login_user_model.dart';
import 'package:nabny/model/logout_user_model.dart';
import 'package:nabny/model/response_user_model.dart';
import 'package:nabny/model/setting_model.dart';
import 'package:nabny/repositries/repositries_status.dart';

import '../../model/check_mobile_user_model.dart';
import '../../model/companiesModel.dart';
import '../../model/favouriteModel.dart';
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

  static Future<LoginUserModel?> createAccountByDetailUser(
      String phone, String firstname,
      String lastname, String email,
      String password, String fcmToken) async {
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
          await Dio().post(URL + 'step2/register', data: fromData);

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

  static Future<SettingModel?> GetSettingUser(String Authorization) async {
    SettingModel? settingModel;
    try {
      Response response =
      await Dio().get(URL + 'setting', options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization'
          }
      ));

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

  static Future<ProfileUserModel?> checkProfileDetails(String Authorization) async {
    ProfileUserModel? profileUserModel;
    try {
      Response response =
      await Dio().get(URL + 'profile', options: Options(
        headers: {
          'Authorization': 'Bearer $Authorization'
        }
      ));

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


  static Future<HomeUserModel?> checkHomeDetailsUser(String Authorization, String Language) async {
    HomeUserModel? homeUserModel;
    // var formData = FormData.fromMap({
    //   'lat' : lat,
    //   'lng' : lng,
    // });
    try {
      Response response =
      await Dio().post(URL + 'home', options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language' : '$Language'
          }
      ));

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

  static Future<FavouriteModel?> GetFavoriteUser(String Authorization, String Language) async {
    FavouriteModel? favouriteModel;
    // var formData = FormData.fromMap({
    //   'lat' : lat,
    //   'lng' : lng,
    // });
    try {
      Response response =
      await Dio().get(URL + 'favourites', options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language' : '$Language'
          }
      ));

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

  static Future<ResponseUserModel?> AddFavoriteUser(String Authorization, String Language, String companyId) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'company_id' : companyId,
    });
    try {
      Response response =
      await Dio().post(URL + 'favourites/add',data: formData,options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language' : '$Language'
          }
      ));

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

  static Future<ResponseUserModel?> RemoveFavoriteUser(String Authorization, String Language, String favouriteId) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'favourite_id' : favouriteId,
    });
    try {
      Response response =
      await Dio().post(URL + 'favourites/remove',data: formData,options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language' : '$Language'
          }
      ));

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

  static Future<LocationModel?> GetLocationUser(String Authorization, String Language) async {
    LocationModel? locationModel;
    // var formData = FormData.fromMap({
    //   'lat' : lat,
    //   'lng' : lng,
    // });
    try {
      Response response =
      await Dio().get(URL + 'location', options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language' : '$Language'
          }
      ));

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

  static Future<ResponseUserModel?> AddLocationUser(String Authorization, String Language,double lat, double lng, String myLocation) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'lat' : lat,
      'lng' : lng,
      'address_ar' : myLocation,
    });
    try {
      Response response =
      await Dio().post(URL + 'location/add', data: formData,options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language' : '$Language'
          }
      ));

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

  static Future<CompaniesModel?> GetCompaniesDetails(String Authorization, String Language,double lat, double lng, String category) async {
    CompaniesModel? companiesModel;
    var formData = FormData.fromMap({
      'lat' : lat,
      'lng' : lng,
      'category' : category,
    });
    try {
      Response response =
      await Dio().post(URL + 'companies', data: formData,options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language' : '$Language'
          }
      ));

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

  static Future<ResponseUserModel?> updateMyLocationInMap(String Authorization, String Language, double lat, double lng, String myLocation) async {
    ResponseUserModel? responseUserModel;
    var formData = FormData.fromMap({
      'lat' : lat,
      'lng' : lng,
      'address' : myLocation,
    });
    try {
      Response response =
      await Dio().post(URL + 'update_user_location',data: formData, options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization',
            'Accept-Language' : '$Language'
          }
      ));

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

  static Future<CheckMobileUserModel?> updateProfileUser(
      String firstname, String lastname,String Authorization,
      String email, String image) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'image': image,
    });
    try {
      Response response = await Dio().post(URL + 'updateprofile', data: fromData, options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization'
          }
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

  static Future<CheckMobileUserModel?> changPasswordUser(
      String Authorization, String password,String old_password) async {
    CheckMobileUserModel? checkMobileModel;
    var fromData = FormData.fromMap({
      'old_password': old_password,
      'password': password,
    });
    try {
      Response response = await Dio().post(URL + 'changepassword', data: fromData, options: Options(
          headers: {
            'Authorization': 'Bearer $Authorization'
          }
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
