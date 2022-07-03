
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

class GoogleMapLocaitonUserController extends GetxController {
  bool isSaving = false;

  get is_saving => isSaving;

  setSeving (bool saving){
    isSaving = saving;
    update();
  }
  // Get.find<StorageService>().GetToken
  updateMyLocationFromMap(lat,lng,myLocation){
  //  setSeving(true);
    print(Get.find<MyLocalController>().language!.languageCode);
    print(lat);
    print(lng);
    print(myLocation);
    MyServiceApi.updateMyLocationInMap('Bearer 22|wWqSoaWXXkPlAISpex0B9fG8jEuMQLvl4SeWzdvG', Get.find<MyLocalController>().language!.languageCode,
        lat, lng, myLocation).then((value){
      if(value?.success == true){
        setSeving(false);
        CustomFlutterToast('${value?.message}');
      }else if (value?.success == false){
        setSeving(false);
        CustomFlutterToast('${value?.message}');
      }
    });
  }
}