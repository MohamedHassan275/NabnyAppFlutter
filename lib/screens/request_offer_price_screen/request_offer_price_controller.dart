import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/model/OfferOrderRequestModel.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

class RequestOfferPriceController extends GetxController{

  bool Loading = false;
  List<OfferOrderRequestResponseModel>? _offerOrderRequestResponseModel;

  get loading => Loading;
  List<OfferOrderRequestResponseModel>? get offerOrderRequestResponseModel => _offerOrderRequestResponseModel;

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  setOfferOrder(List<OfferOrderRequestResponseModel>? offerOrderRequestModel){
    _offerOrderRequestResponseModel =   offerOrderRequestModel;
    update();
  }

  RequestOfferPriceController(){
    getRequestOfferPrice();
  }

  getRequestOfferPrice(){
    setLoading(true);
    MyServiceApi.GetRequestOfferPrice(Get.find<StorageService>().GetToken,Get.find<StorageService>().activeLocale.languageCode).then((value){
      if(value?.success == true){
        setLoading(false);
        print('offer Order Request is length${value?.offerOrderRequestResponseModel!.length}');
        setOfferOrder(value?.offerOrderRequestResponseModel);
      }else {
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

}