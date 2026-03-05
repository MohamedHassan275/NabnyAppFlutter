
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

class SaveMyLocationController extends GetxController {
  bool isLoading = false;

  get is_loading => isLoading;

  setSeving (bool saving){
    isLoading = saving;
    update();
  }

  SaveMyLocationFromMap(lat, lng, myLocationAr, myLocationEn){
    setSeving(true);
    MyServiceApi.AddLocationUser('Bearer '+Get.find<StorageService>().GetToken,
        lat, lng, myLocationAr, myLocationEn).then((value){
      if(value?.success == true){
        setSeving(false);
        CustomFlutterToast('${value?.message}');
        // رجوع للشاشة السابقة (شاشة عناويني) وهي هتعمل refresh تلقائياً
        Get.back();
      }else if (value?.success == false){
        setSeving(false);
        CustomFlutterToast('${value?.message}');
      }
    });
  }
}