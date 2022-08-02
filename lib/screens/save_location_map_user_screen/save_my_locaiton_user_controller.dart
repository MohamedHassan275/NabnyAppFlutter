
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

class SaveMyLocationController extends GetxController {
  bool isLoading = false;

  get is_loading => isLoading;

  setSeving (bool saving){
    isLoading = saving;
    update();
  }
  // Get.find<StorageService>().GetToken
  SaveMyLocationFromMap(lat,lng,myLocationAr,myLocationEn){
    setSeving(true);
    // print(Get.find<MyLocalController>().language!.languageCode);
    // print(lat);
    // print(lng);
    // print(myLocation);
    MyServiceApi.AddLocationUser('Bearer '+Get.find<StorageService>().GetToken,
        lat, lng, myLocationAr,myLocationEn).then((value){
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