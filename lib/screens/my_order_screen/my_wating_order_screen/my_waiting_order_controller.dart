import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

class MyNewOrderController extends GetxController {
  bool Loading = false;
//  List<NewOrder>? _newOrder;
  final RxList _newOrder = [].obs;
  get loading => Loading;
  List get newOrder => _newOrder.value;
  // List<NewOrder>? get newOrder => _newOrder;

  setLoading(bool loading) {
    Loading = loading;
    update();
    
  }


  getMyNewOrderUser() {
    setLoading(true);
    MyServiceApi.GetNewMyOrderUser(Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode).then((value) {
      print("my order status is ${value?.success}");
      print("my newOrder length is ${value?.newOrder?.length}");
      if (value?.success == true) {
        _newOrder.value = value!.newOrder!;
        print('new order is length ${value.newOrder!.length}');
      } else if (value?.success == false) {
        CustomFlutterToast(value?.message);
      }
    }).catchError((e) {
      print('getMyNewOrderUser error: $e');
    }).whenComplete(() {
      setLoading(false);
    });
  }

  @override
  void onInit() {
    super.onInit();
    getMyNewOrderUser();
  }
}
