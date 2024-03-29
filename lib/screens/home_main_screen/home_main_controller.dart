
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_screen/home_screen.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';
import 'package:nabny/screens/my_order_screen/my_order_screen.dart';
import 'package:nabny/screens/setting_screen/setting_screen.dart';

import '../../model/profile_user_model.dart';
import '../../utils/Themes.dart';
import '../request_offer_price_screen_menu/request_offer_price_companies_screen.dart';

class HomeMainController extends GetxController {

  bool isLogout = false;
  int? indexPage = 0;

  bool isLoading = false;
  ProfileUserResponseModel? _profileUserModel;

  get isloading => isLoading;
  get profileUserModel => _profileUserModel;

  get islogout => isLogout;

  setLogout(bool logout){
    isLogout = logout;
    update();
  }
  setprofileUser(ProfileUserResponseModel? profile){
    _profileUserModel = profile;
  }
  setLoading(bool loading) {
    isLoading = loading;
    update();
  }

 // List<Widget> PageList = [const HomeScreen(),const MyOrderScreen(), SettingScreen()];
  List<Widget> PageList = [const HomeScreen(),const MyOrderScreen(), const RequestOfferPriceCompaniesScreen(),const SettingScreen()];

  List<BottomNavigationBarItem> navigationItem = [
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsIconHome2,width: 30,height: 30,color: Themes.ColorApp11,),label: 'home'.tr,
        activeIcon: Image.asset(Assets.iconsIconHome2,width: 30,height: 30,color: Themes.ColorApp10,)),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsMyOrderHome,width: 30,height: 30,),label: 'my_order'.tr,
        activeIcon: Image.asset(Assets.iconsMyOrderHome2,width: 30,height: 30,)),
    BottomNavigationBarItem(icon: Image.asset(Assets.imagesOrderPriceImage,width: 30,height: 30,color: Themes.ColorApp11,),label: 'request_order_company'.tr,
        activeIcon: Image.asset(Assets.imagesOrderPriceImage,width: 30,height: 30,color: Themes.ColorApp10,)),
    BottomNavigationBarItem(icon: Image.asset(Assets.iconsSettingHomeIcon,width: 30,height: 30,color: Themes.ColorApp11,),label: 'setting'.tr,
        activeIcon: Image.asset(Assets.iconsSettingHomeIcon,width: 30,height: 30,color: Themes.ColorApp10,)),
  ];

  HomeMainController(){
    getProfileDetailsUser();
  }
  getProfileDetailsUser() async {
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

  logoutUser(Authorization){
    setLogout(true);
    print(Authorization);
    MyServiceApi.LogoutUser(Authorization).then((value) {
      if(value?.success == true){
        setLogout(false);
        CustomFlutterToast(value?.message);
        Get.find<StorageService>().clear();
        Get.offAll(const LoginScreen());
      }else if(value?.success == false){
        setLogout(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

}