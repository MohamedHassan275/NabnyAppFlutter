import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/model/profile_user_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileInformationController extends GetxController {
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProfileUserResponseModel? ProfileUserModel;

  get isloading => isLoading;
  get formKey => _formKey;
  get profileUserModel => ProfileUserModel;

  setprofileUser(ProfileUserResponseModel? profile){
    ProfileUserModel = profile;
  }
  setLoading(bool loading) {
    isLoading = loading;
    update();
  }

  ProfileInformationController(){
    getProfileDetailsUser();
  }
  getProfileDetailsUser() {
    setLoading(true);
    MyServiceApi.checkProfileDetails(Get.find<StorageService>().GetToken).then((value) {
      if(value?.success == true){
        setLoading(false);
        setprofileUser(value?.profileUserResponseModel);
      }else if (value?.success == false){
        setLoading(false);
        CustomFlutterToast('${value?.message}');
      }
    });
  }

  updateProfileUser(firstname,lastname,email,image,Authorization){
    setLoading(true);
    MyServiceApi.updateProfileUser(firstname, lastname, Authorization, email, image).then((value){
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
