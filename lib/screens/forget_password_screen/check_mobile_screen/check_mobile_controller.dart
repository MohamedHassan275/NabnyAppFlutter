import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/repositries/repositries_status.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/forget_password_screen/activation_password/activation_password_screen.dart';

import '../../../core/constant/Themes.dart';
import '../../../core/constant/constant.dart';
import '../../../model/check_mobile_user_model.dart';

class CheckMobileController extends GetxController {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool? get isloading => isLoading;

  setLoading(bool isloading) {
    isLoading = isloading;
    update();
  }

  get formKey => _formKey;

  checkMobilePhone(phone) {
    if (_formKey.currentState!.validate()) {
      setLoading(true);
      print('${phone}');
      MyServiceApi.checkMobileByForgetPassword(phone).then((value) {
        if (value?.success == true) {
          setLoading(false);
          print(value?.message);
          CustomFlutterToast('${value?.data!.registercode}');
          print('${value?.data!.registercode}');
          print('${phone}');
          Get.offAll(ActivationPasswordScreen(
            registercode: '${value?.data!.registercode}',
            mobilePhone: '$phone',
          ));
        } else if (value?.success == false) {
          setLoading(false);
          CustomFlutterToast('${value?.message}');
        }
      });
    }
  }
// checkMobilePhone(String phone) async{
//   var Resposne = await MyServiceApi.checkMobileByForgetPassword(phone);
//   if (Resposne is SUCCESS){
//     setCheckMobileModel(Resposne.response as CheckMobileUserModel);
//   }else if (Resposne is Failure){
//     setErrorResponse(Resposne.errorResponse.toString());
//   }
// }

}
