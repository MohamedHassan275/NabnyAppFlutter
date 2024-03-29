
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

class GetMyLocationController extends GetxController {
  bool isLoading = false;

  get is_loading => isLoading;

  setSeving (bool saving){
    isLoading = saving;
    update();
  }
  // Get.find<StorageService>().GetToken
  updateMyLocationFromMap(lat,lng,myLocation){
    setSeving(true);
    // print(Get.find<MyLocalController>().language!.languageCode);
    // print(lat);
    // print(lng);
    // print(myLocation);
    MyServiceApi.updateMyLocationInMap('Bearer '+Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode,
        lat, lng, myLocation).then((value){
      if(value?.success == true){
        setSeving(false);
        CustomFlutterToast('${value?.message}');
        print(Get.find<StorageService>().GetToken);
        Get.offAll(HomeMainScreen(valueBack: ''));
      }else if (value?.success == false){
        setSeving(false);
        CustomFlutterToast('${value?.message}');
      }
    });
  }
}