
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

class LoginController extends GetxController{

  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get isloading => isLoading;
  get formKey =>_formKey;

  setLoading(bool loading){
    isLoading = loading;
    update();
  }

   checkLoginUser(mobilePhone,password,token){
    if(_formKey.currentState!.validate()){
      print(mobilePhone);
      print(password);
      print(token);
      setLoading(true);
      MyServiceApi.checkLoginUser(mobilePhone, password, token).then((value){
        if(value!.success == true){
          setLoading(false);
          Get.find<StorageService>().SetToken('${value.data!.accesstoken}');
          CustomFlutterToast('${value.message}');
          CustomFlutterToast(value.data!.accesstoken);
          Get.to(HomeMainScreen(valueBack: ''));
        }else if(value.success == false){
          setLoading(false);
          CustomFlutterToast('${value.message}');
        }
      });
    }
  }
}