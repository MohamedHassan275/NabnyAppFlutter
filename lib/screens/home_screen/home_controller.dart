
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/model/home_user_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

import '../../core/localization/local_controller.dart';
import '../../core/servies/storage_service.dart';
import '../../generated/assets.dart';
import '../../model/SliderItemsModel.dart';
import '../../model/factory_model.dart';

class HomeController extends GetxController{

  bool isLoading = false;
  HomeUserResponseModel? _homeUserModel;

  get isloading => isLoading;
  HomeUserResponseModel? get homeUserModel => _homeUserModel;

  setLoading(bool isloading){
    isLoading = isloading;
    update();
  }

  setHomeUser(HomeUserResponseModel? homeUserModel){
    _homeUserModel = homeUserModel;
  }

  HomeController(){
    getHomeDetailsUser();
  }

  getHomeDetailsUser(){
    setLoading(true);
    MyServiceApi.checkHomeDetailsUser(Get.find<StorageService>().GetToken, '${Get.find<StorageService>().activeLocale.languageCode}').then((value){
      if(value?.success == true){
        setLoading(false);
      //  CustomFlutterToast('${value?.homeUserResponseModel?.currentLocation?.address}');
        setHomeUser(value?.homeUserResponseModel);
      }else if(value?.success == false){
        setLoading(false);
        CustomFlutterToast('${value?.message}');
      }
    });
  }

  AddFavoriteCompany(companyId){
    setLoading(true);
    MyServiceApi.AddFavoriteUser(Get.find<StorageService>().GetToken, '${Get.find<StorageService>().activeLocale.languageCode}',companyId).then((value){
      if(value?.success == true){
        setLoading(false);
        CustomFlutterToast(value?.message);
      }else {
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }
}