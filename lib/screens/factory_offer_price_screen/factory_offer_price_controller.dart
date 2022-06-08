
import 'package:get/get.dart';
import 'package:nabny/model/factory_offer_price_model.dart';

import '../../generated/assets.dart';

class FactoryOfferPriceController extends GetxController {

  bool isLoading = false;

  get Loading => this.isLoading;
  set IsLoading (bool Loading) => Loading = isLoading;

  RxList<FactoryOfferPriceModel> factoryOfferPriceModel = List<FactoryOfferPriceModel>.from([
    FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
    FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
    FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
    FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
    FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
    FactoryOfferPriceModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km','1000 ريال '),
  ]).obs;
}