import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/model/my_order_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

import '../../../generated/assets.dart';
import '../../repositries/repositries_status.dart';


class MyOrderController extends GetxController {

  bool Loading = false;
  MyOrderResponseModel? _myOrderResponseModel;

  get loading => Loading;
  MyOrderResponseModel? get myOrderResponseModel => _myOrderResponseModel;

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  setMyOrderUser(MyOrderResponseModel? myOrderResponseModel){
    _myOrderResponseModel = myOrderResponseModel;
  }

  MyOrderController(){
    getMyOrderUser();
  }

  getMyOrderUser(){
    setLoading(true);
    MyServiceApi.GetMyOrderUser(Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode).then((value){
      print("my order status is ${value?.success}");
      if(value?.success == true){
        setLoading(false);
        setMyOrderUser(value?.myOrderResponseModel);
      }else if(value?.success == false){
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

}