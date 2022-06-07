
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../model/SliderItemsModel.dart';
import '../../model/factory_model.dart';

class HomeController extends GetxController{


  bool Loading = false;

  RxList<SliderItemsModel> SlidersList = List<SliderItemsModel>.from([
    SliderItemsModel(Assets.imagesSliderImage),
    SliderItemsModel(Assets.imagesSliderImage),
    SliderItemsModel(Assets.imagesSliderImage),
    SliderItemsModel(Assets.imagesSliderImage),
    SliderItemsModel(Assets.imagesSliderImage),
  ]).obs;


  RxList<FactoryModel> factoryModel = List<FactoryModel>.from([
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
  ]).obs;


}