import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/factory_model.dart';

class MyFavoriteController extends GetxController {

  bool Loading = false;
  
  RxList<FactoryModel> factoryModel = List<FactoryModel>.from([
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
    FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
  ]).obs;


}