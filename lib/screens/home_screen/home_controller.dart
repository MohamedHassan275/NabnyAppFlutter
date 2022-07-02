
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/model/home_user_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

import '../../generated/assets.dart';
import '../../model/SliderItemsModel.dart';
import '../../model/factory_model.dart';

class HomeController extends GetxController{

  bool isLoading = false;
  HomeUserModel? _homeUserModel;

  get isloading => isLoading;
  HomeUserModel? get homeUserModel => _homeUserModel;

  setLoading(bool isloading){
    isLoading = isloading;
    update();
  }

  setHomeUser(HomeUserModel? homeUserModel){
    _homeUserModel = homeUserModel;
  }

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

  getHomeDetailsUser(Authorization,Language,lat,lng){
    setLoading(true);
    MyServiceApi.checkHomeDetailsUser(Authorization, Language, lat, lng).then((value){
      if(value?.success == true){
        setLoading(false);
        CustomFlutterToast('${value?.homeUserResponseModel?.currentLocation?.address}');
        setHomeUser(value);
      }else if(value?.success == false){
        setLoading(false);
        CustomFlutterToast('${value?.message}');
      }
    });
  }
}