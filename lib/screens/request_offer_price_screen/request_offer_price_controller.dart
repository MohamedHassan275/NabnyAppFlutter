import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/request_offer_order_model.dart';

class RequestOfferPriceController extends GetxController{

  bool isLoading = false;

  get Loading => this.isLoading;
  set IsLoading (bool Loading) => Loading = isLoading;

  RxList<RequestOfferOrderModel> requestOfferOrderModel = List<RequestOfferOrderModel>.from([
    RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
    'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
    RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
        'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
    RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
        'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
    RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
        'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
    RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
        'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
    RequestOfferOrderModel(Assets.iconsFactoryNamIcon,'جده حي الوزيريه قاعه امنيتي ','2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
        'سقف','22/06/2022','25 متر','نوع الخلطه','نوع الاسمنتنوع الاسمنت','مقاس الحجر','مواصفات خاصة','بدون مضخة'),
  ]).obs;
}