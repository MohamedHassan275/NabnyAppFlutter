import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/factory_model.dart';
import 'package:nabny/model/favouriteModel.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

import '../../core/constant/constant.dart';

class MyFavoriteController extends GetxController {

  bool Loading = false;
  late List<FavouriteResponseModel> _favouriteResponseModel;
  late FavouriteModel _favouriteModel;

  get loading => Loading;
  List<FavouriteResponseModel> get favouriteResponseModel => _favouriteResponseModel;
  FavouriteModel get favoriteModel => _favouriteModel;

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  setFavoriteUserList(FavouriteModel favouriteModels){
    _favouriteModel = favouriteModels;
  }


  MyFavoriteController(){
    getFavoriteUserList();
  }

  getFavoriteUserList(){
    setLoading(true);
    MyServiceApi.GetFavoriteUser(Get.find<StorageService>().GetToken, Get.find<MyLocalController>().language!.languageCode).then((value){
      print(value);
      print(value?.success);
      if(value?.success == true){
        setLoading(false);
        print(value?.success);
        print(value!);
        setFavoriteUserList(value);
      }else if (value?.success == false){
        setLoading(false);
        CustomFlutterToast('${value?.message}');
      }
    });
  }

  // RxList<FactoryModel> factoryModel = List<FactoryModel>.from([
  //   FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
  //   FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
  //   FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
  //   FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
  //   FactoryModel(Assets.imagesFactoryImage, 'شركه بن لادن', 'جيد جدا', '4.7', '250 km'),
  // ]).obs;
  //
  //
  //
}