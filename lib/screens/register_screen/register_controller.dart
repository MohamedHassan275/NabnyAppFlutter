
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/complete_register_screen/complete_register_screen.dart';

import '../verification_code/verification_code_controller.dart';
import '../verification_code/verification_code_screen.dart';

class RegisterController extends GetxController{
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  VerificationCodeController verificationCodeController = Get.put(VerificationCodeController());

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
          Get.off(VerificationCodeScreen(registercode: '${value?.data?.registercode}', mobilePhone: mobilePhone,));
          // MyServiceApi.activeCodeByRegister(mobilePhone, '${value?.data?.registercode}').then((value){
          //   if(value?.success == true){
          //     CustomFlutterToast('${value?.message}');
          //     Get.off(CompleteRegisterScreen(mobilePhone: mobilePhone,));
          //   }else {
          //     setLoading(false);
          //     CustomFlutterToast('${value?.message}');
          //   }
          // });
        }else if(value?.success == false){
          setLoading(false);
          CustomFlutterToast('${value?.message}');
        }
      });
    }
  }
}