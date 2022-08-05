
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/complete_register_screen/complete_register_screen.dart';

import '../verification_code/verification_code_screen.dart';

class RegisterController extends GetxController{
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get isloading => isLoading;
  get formKey => _formKey;

  setLoading(bool isloading){
    isLoading = isloading;
    update();
  }
  createAccount(mobilePhone){
    if(_formKey.currentState!.validate()){
      setLoading(true);
      MyServiceApi.CreateAccountUserByMobile(mobilePhone).then((value){
        if(value?.success == true){
          setLoading(false);
          print(mobilePhone);
          print('${value?.data?.registercode}');
          CustomFlutterToast('${value?.data?.registercode}');
          Get.off(CompleteRegisterScreen(mobilePhone: mobilePhone,));
        }else if(value?.success == false){
          setLoading(false);
          CustomFlutterToast('${value?.data?.registercode}');
        }
      });
    }
  }
}