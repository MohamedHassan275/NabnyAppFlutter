import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nabny/repositries/repositries_status.dart';

import '../../model/forget_password_model/CheckMobileModel.dart';

class MyServiceApi {


 // static  Future<CheckMobileModel> checkMobileByForgetPassword(int mobilePhone) async {
 //   var response = await Dio().post(Uri.parse( 'https://nebny.net/api/v2/forgetpassword'),
 //       body: {
 //         'phone',mobilePhone,
 //       });
 //   if(response.statusCode == 200){
 //     var responseBody = json.decode(response.body);
 //     print(responseBody);
 //     return CheckMobileModel.fromJson(responseBody);
 //   }else {
 //     throw Exception('can`t send data');
 //   }
 //
 // }

 static Future<Object> checkMobileByForgetPassword2(String phone) async {
   CheckMobileModel? checkMobileModel;
   var fromData = FormData.fromMap({
     'phone': phone,
   });

   var URL = 'https://nebny.net/api/v2/';

   try {
     Response response = await Dio().post(
         URL+'forgetpassword', data: fromData);

     if (response.statusCode == 200) {
       print(response.statusCode);
       print(response.data);
       return SUCCESS(response: CheckMobileModel.fromJson(response.data));
     } else {
       // print('${response.statusMessage} : ${response.statusCode}');
       // throw response.statusMessage!;
       return Failure(errorResponse: 'can`t have data');
     }
   }on DioError catch (e){
     // if (e.response != null) {
     //   print('Dio error!');
     //   print('STATUS: ${e.response?.statusCode}');
     //   print('DATA: ${e.response?.data}');
     //   print('HEADERS: ${e.response?.headers}');
     // } else {
     //   // Error due to setting up or sending the request
     //   print('Error sending request!');
     //   print(e.message);
     // }
   }
   return checkMobileModel!;
 }

}