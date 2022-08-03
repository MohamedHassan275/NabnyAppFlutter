
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

import '../../generated/assets.dart';

class FactoryOfferPriceController extends GetxController {

  bool Loading = false;

  get loading => this.Loading;

  setIsLoading (bool loading) {
    Loading = loading;
    update();
  }


  AcceptOfferRequest(String orderId,String requestId){
    setIsLoading(true);
    MyServiceApi.AcceptOfferOrderRequest(Get.find<StorageService>().GetToken, Get.find<StorageService>().GetLanguage,
        orderId, requestId).then((value){
          if (value?.success == true){
            setIsLoading(false);
            CustomFlutterToast(value?.message);
            Get.offAll(HomeMainScreen(valueBack: ''));
          }else {
            setIsLoading(false);
            CustomFlutterToast(value?.message);
          }
    });
  }

  CancelOfferRequest(String orderId){
    setIsLoading(true);
    MyServiceApi.CancelOfferOrderRequest(Get.find<StorageService>().GetToken, Get.find<StorageService>().GetLanguage,
        orderId).then((value){
      if (value?.success == true){
        setIsLoading(false);
        CustomFlutterToast(value?.message);
        Get.offAll(HomeMainScreen(valueBack: ''));
      }else {
        setIsLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

  // RxList<FactoryOfferPriceModel> factoryOfferPriceModel = List<FactoryOfferPriceModel>.from([
  //   FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
  //   FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
  //   FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
  //   FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
  //   FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
  //   FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
  // ]).obs;
}