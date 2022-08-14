import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/model/my_current_order_model.dart';
import 'package:nabny/model/my_new_order_model.dart';
import 'package:nabny/model/my_previous_order_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

import '../../../generated/assets.dart';


class MyPreviousOrderController extends GetxController {

  bool Loading = false;
  List<PreviousOrder>? _previousOrder;
  String? _formattedDateCurrent;
  get loading => Loading;
  get formattedDateCurrent => _formattedDateCurrent;
  List<PreviousOrder>? get previousOrder => _previousOrder;

  getCurrentTime(){
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    _formattedDateCurrent = formatter.format(now);
    print(formattedDateCurrent);
    CustomFlutterToast(formattedDateCurrent);
  }

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  setMyOrderUser(List<PreviousOrder>? previousOrder){
    _previousOrder = previousOrder;
  }

  MyPreviousOrderController(){
    getPreviousMyOrderUser();
    getCurrentTime();
  }

  getPreviousMyOrderUser(){
    setLoading(true);
    MyServiceApi.GetMyPreviousOrderUser(Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode).then((value){
      print("my order status is ${value?.success}");
      if(value?.success == true){
        print("my previousOrder order status is ${value?.previousOrder!.length}");
        setLoading(false);
        setMyOrderUser(value?.previousOrder);
      }else if(value?.success == false){
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

}