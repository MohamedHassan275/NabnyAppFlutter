import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/model/profile_user_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

class ProfileInformationController extends GetxController {
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProfileUserResponseModel? _profileUserModel;

  get isloading => isLoading;
  get formKey => _formKey;
  get profileUserModel => _profileUserModel;

  setprofileUser(ProfileUserResponseModel? profile){
    _profileUserModel = profile;
  }
  setLoading(bool loading) {
    isLoading = loading;
    update();
  }

  getProfileDetailsUser(Authorization) {
    setLoading(true);
    MyServiceApi.checkProfileDetails(Authorization).then((value) {
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
    if(_formKey.currentState!.validate()){
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
}
