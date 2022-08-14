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


class MyNewOrderController extends GetxController {

  bool Loading = false;
//  List<NewOrder>? _newOrder;
  final RxList<NewOrder>? _newOrder = <NewOrder>[].obs;
  get loading => Loading;
  List get newOrder => _newOrder!.value;
 // List<NewOrder>? get newOrder => _newOrder;

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  // setMyOrderUser(List<NewOrder>? newOrder){
  //   _newOrder = newOrder;
  //   update();
  // }

  MyNewOrderController(){
    getMyNewOrderUser();
  }

  getMyNewOrderUser(){
    setLoading(true);
    MyServiceApi.GetNewMyOrderUser(Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode).then((value){
      print("my order status is ${value?.success}");
      print("my newOrder order length is ${value?.newOrder!.length}");
      if(value?.success == true){
        setLoading(false);
        _newOrder!.value = value!.newOrder!;
      }else if(value?.success == false){
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyNewOrderUser();
  }
}