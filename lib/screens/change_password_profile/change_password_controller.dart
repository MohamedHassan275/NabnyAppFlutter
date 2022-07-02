
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/constant.dart';
import '../../repositries/servies_api/MyServiceApi.dart';
import '../home_main_screen/home_main_screen.dart';

class ChangePasswordController extends GetxController {
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  get isloading => isLoading;
  get formKey => _formKey;

  setLoading(bool loading) {
    isLoading = loading;
    update();
  }

  changePasswordUser(Authorization,oldPassword,newPassword){
    setLoading(true);
   if(_formKey.currentState!.validate()){
     MyServiceApi.changPasswordUser(Authorization, oldPassword, newPassword).then((value){
       if(value?.success == true){
         setLoading(false);
         CustomFlutterToast('${value?.message}');
         Get.off(HomeMainScreen(valueBack: ''));
       }else if(value?.success == false){
         setLoading(false);
         CustomFlutterToast('${value?.message}');
       }
     });
   }
  }
}