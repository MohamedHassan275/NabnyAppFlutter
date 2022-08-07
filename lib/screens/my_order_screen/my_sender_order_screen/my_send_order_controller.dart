import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/model/my_current_order_model.dart';
import 'package:nabny/model/my_new_order_model.dart';
import 'package:nabny/model/my_send_order_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

import '../../../generated/assets.dart';


class MySendOrderController extends GetxController {

  bool Loading = false;
  List<SendOrder>? _sendOrder;

  get loading => Loading;
  List<SendOrder>? get sendOrder => _sendOrder;

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  setMyOrderUser(List<SendOrder>? sendOrder){
    _sendOrder = sendOrder;
  }

  MySendOrderController(){
    getMySendOrderUser();
  }

  getMySendOrderUser(){
    setLoading(true);
    MyServiceApi.GetMySendOrderUser(Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode).then((value){
      print("my order status is ${value?.success}");
      if(value?.success == true){
        setLoading(false);
        setMyOrderUser(value?.sentOrder);
      }else if(value?.success == false){
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

}