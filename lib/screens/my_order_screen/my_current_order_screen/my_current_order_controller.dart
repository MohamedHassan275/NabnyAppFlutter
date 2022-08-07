import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/model/my_current_order_model.dart';
import 'package:nabny/model/my_new_order_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

import '../../../generated/assets.dart';
import '../../home_main_screen/home_main_screen.dart';


class MyCurrentOrderController extends GetxController {

  bool Loading = false;
  String? formattedDateCurrent;
  List<CurrentOrder>? _currentOrder;

  get loading => Loading;
  List<CurrentOrder>? get currentOrder => _currentOrder;

  getCurrentTime(){
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    formattedDateCurrent = formatter.format(now);
    print(formattedDateCurrent);
    CustomFlutterToast(formattedDateCurrent);
  }
  setLoading(bool loading){
    Loading = loading;
    update();
  }

  setMyOrderUser(List<CurrentOrder>? currentOrder){
    _currentOrder = currentOrder;
  }

  MyCurrentOrderController(){
    getMyOrderUser();
    getCurrentTime();
  }

  getMyOrderUser(){
    setLoading(true);
    MyServiceApi.GetMyCurrentOrderUser(Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode).then((value){
      print("my order status is ${value?.success}");
      if(value?.success == true){
        setLoading(false);
        setMyOrderUser(value?.currentOrder);
      }else if(value?.success == false){
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

  ReceivedOrder(String orderId){
    setLoading(true);
    CustomFlutterToast(orderId);
    CustomFlutterToast(Get.find<StorageService>().GetToken);
    CustomFlutterToast(Get.find<StorageService>().activeLocale.languageCode);
    print(Get.find<StorageService>().GetToken);
    MyServiceApi.ReceivedOfferOrderRequest(Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode,
        orderId).then((value){
      if(value?.success == true){
        setLoading(false);
        CustomFlutterToast(value?.message);
        Get.off(HomeMainScreen(valueBack: ''));
      }else {
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }


}