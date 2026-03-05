import 'package:get/get.dart';
import 'package:nabny/model/setting_model.dart';

import '../../core/constant/constant.dart';
import '../../core/servies/storage_service.dart';
import '../../repositries/servies_api/MyServiceApi.dart';

class SettingController extends GetxController {

  bool isloading = false;
  SettingResponseModel? settingResponseModel;

  get isLodaing => isloading;

  setLoading(bool isLoading) {
    isloading = isLoading;
    update();
  }

  setGetSettingUser(SettingResponseModel? settingResponse) {
    settingResponseModel = settingResponse;
    update();
  }

  SettingController(){
    getProfileDetailsUser();
  }

  getProfileDetailsUser() {
    setLoading(true);
    print(Get.find<StorageService>().GetToken);
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