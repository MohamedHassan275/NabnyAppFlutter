import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/OfferOrderRequestModel.dart';
import 'package:nabny/model/request_offer_order_model.dart';
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
    update();
  }

  getRequestOfferPrice(){
    setLoading(true);
    MyServiceApi.GetRequestOfferPrice(Get.find<StorageService>().GetToken,Get.find<StorageService>().GetLanguage).then((value){
      if(value?.success == true){
        setLoading(false);
        print(value?.offerOrderRequestResponseModel!.length);
        setOfferOrder(value?.offerOrderRequestResponseModel);
      }else {
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

  // RxList<RequestOfferOrderModel> requestOfferOrderModel = List<RequestOfferOrderModel>.from([
  //   RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
  //   'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
  //   RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
  //       'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
  //   RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
  //       'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
  //   RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
  //       'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
  //   RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
  //       'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
  //   RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
  //       'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
  // ]).obs;
}