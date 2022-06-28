
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../core/constant/constant.dart';
import '../../../model/forget_password_model/CheckMobileModel.dart';

class CheckMobileController extends GetxController {

  bool isLoading = false;
  CheckMobileModel? checkMobileModel;
  String? errorResponse;

  bool? get isloading => isLoading;
  CheckMobileModel? get _checkMobileModel => checkMobileModel;
  String? get _errorResponse => errorResponse;

  setLoading(bool isloading){
    isLoading = isloading;
  }

  setCheckMobileModel (CheckMobileModel _checkMobileModel){
    checkMobileModel = _checkMobileModel;
    update();
  }
  setErrorResponse (String _errorResponse){
    errorResponse = _errorResponse;
  }



}