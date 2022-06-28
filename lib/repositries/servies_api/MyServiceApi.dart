import 'dart:convert';

import 'package:http/http.dart';

import '../../model/forget_password_model/CheckMobileModel.dart';

class MyServiceApi {


 static  Future<CheckMobileModel> checkMobileByForgetPassword(int mobilePhone) async {
   var response = await post(Uri.parse( 'https://nebny.net/api/v2/forgetpassword'),
       body: {
         'phone',mobilePhone,
       });
   if(response.statusCode == 200){
     var responseBody = json.decode(response.body);
     print(responseBody);
     return CheckMobileModel.fromJson(responseBody);
   }else {
     throw Exception('can`t send data');
   }
 }

 static Future<CheckMobileModel> checkMobileByForgetPassword2(String phone) async {
   var URL = 'https://nebny.net/api/v2/';
  try{
    Response response = await post(Uri.parse( '${URL}forgetpassword'),

        body: {
          'phone': phone,
        });

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);

      print(responseBody);
      return CheckMobileModel.fromJson(responseBody);
    } else {
      throw Exception("Can't load data");
    }
  }catch (e){
    throw Exception(e.toString());
  }

 }

}