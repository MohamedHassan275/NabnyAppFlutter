import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/model/my_previous_order_model.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';



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
   // CustomFlutterToast(formattedDateCurrent);
  }

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  setMyOrderUser(List<PreviousOrder>? previousOrder) {
    _previousOrder = previousOrder;
    update();
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
        setMyOrderUser(value?.previousOrder);
      }else if(value?.success == false){
        CustomFlutterToast(value?.message);
      }
    }).catchError((e){
      print('getPreviousMyOrderUser error: $e');
    }).whenComplete((){
      setLoading(false);
    });
  }

}