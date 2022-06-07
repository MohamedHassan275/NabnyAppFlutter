
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../model/factory_model.dart';

class CategoryConcreteContoller extends GetxController {

  bool Loading = false;

  RxList<FactoryModel> factoryModel = List<FactoryModel>.from([
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
  ]).obs;
}