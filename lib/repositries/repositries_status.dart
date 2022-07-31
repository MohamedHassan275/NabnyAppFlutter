

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nabny/model/my_order_model.dart';

class MyServiceApi2 {

  static String URL = 'https://nebny.net/api/v2/';
  Dio _dio = Dio();

 static Future<MyOrderModel> GetMyOrderuserList (String Authorization,String Language) async {
    Response response = await Dio().get(URL + 'orders',
    options: Options(
      headers: {
        'Authorization': 'Bearer $Authorization',
        'Accept-Language': '$Language',
      }
    ));
    if (response.statusCode == 200){
      return MyOrderModel.fromJson(response.data);
    }else {
      return throw Exception(response.statusMessage);
    }
  }
}

class SUCCESS {
  int? code;
  Object? response;

  SUCCESS({this.code,this.response});
}

class Failure {
  int? code;
  Object? errorResponse;

  Failure({this.code,this.errorResponse});
}