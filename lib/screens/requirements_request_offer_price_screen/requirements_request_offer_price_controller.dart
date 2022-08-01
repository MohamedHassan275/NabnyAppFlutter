import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

class RequirementsRequestOfferPriceController extends GetxController {

  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get isloading => isLoading;
  get formKey =>_formKey;

  setLoading(bool loading){
    isLoading = loading;
    update();
  }

  AddOfferOrderRequest(Authorization, Language, companyId, casting_type, execution_date, qty_m,
      mix_type, cement_type, stone_size, special_description, address, with_pump, pump_length, with_snow, with_lab){
    if (_formKey.currentState!.validate()){
      setLoading(true);
      MyServiceApi.AddOfferOrderRequest(Authorization, Language, companyId, casting_type, execution_date, qty_m,
          mix_type, cement_type, stone_size, special_description, address, with_pump, pump_length, with_snow, with_lab).then((value){
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
}