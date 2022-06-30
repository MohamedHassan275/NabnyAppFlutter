
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageKeys {
  StorageKeys();

  //Declare all storage keys here & create its correpsonding setters & getters
  static const String token = "TOKEN";


}

class MyServices extends GetxService {
 late SharedPreferences sharedPreferences ;

  Future<MyServices> inite() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  //TOKEN
  String get token {
    return sharedPreferences.getString(StorageKeys.token) ?? "";
  }

  set token(String token) {
    sharedPreferences.setString(StorageKeys.token, token);
  }

}

initialServices() async{
  await Get.putAsync(() => MyServices().inite());
}
