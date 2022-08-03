
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

import '../../core/localization/local_controller.dart';
import '../../model/LocationModel.dart';

class MyAddressController extends GetxController {

  bool Loading = false;
  List<LocationResponseModel>? _locationResponseModel;

  get loading => Loading;
  List<LocationResponseModel>? get locationResponseModel => _locationResponseModel;

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  setMyLocationUser(List<LocationResponseModel>? Mylocation){
    _locationResponseModel = Mylocation;
  }

  MyAddressController(){
    getMyLocationUser();
  }

  getMyLocationUser(){
    setLoading(true);
    MyServiceApi.GetLocationUser(Get.find<StorageService>().GetToken,Get.find<StorageService>().activeLocale.languageCode).then((value){
      if(value?.success == true){
        setLoading(false);
        setMyLocationUser(value?.locationResponseModel);
      }else {
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

}