import 'package:get/get.dart';
import 'package:nabny/model/setting_model.dart';

import '../../core/constant/constant.dart';
import '../../core/servies/storage_service.dart';
import '../../repositries/servies_api/MyServiceApi.dart';

class SettingController extends GetxController {

  bool isloading = false;
  SettingResponseModel? settingResponseModel;

  get isLodaing => isloading;
  SettingResponseModel? get _settingResponseModel => settingResponseModel;

  setLoading(bool isLoading){
    isloading = isLoading;
  }

  setGetSettingUser(SettingResponseModel? SettingResponseModel){
    settingResponseModel = SettingResponseModel;
  }

  SettingController(){
    getProfileDetailsUser();
  }

  getProfileDetailsUser() {
    setLoading(true);
    MyServiceApi.GetSettingUser(Get.find<StorageService>().GetToken).then((value) {
      if(value?.success == true){
        setLoading(false);
        setGetSettingUser(value?.settingResponseModel);
      }else if (value?.success == false){
        setLoading(false);
        CustomFlutterToast('${value?.message}');
      }
    });
  }

}