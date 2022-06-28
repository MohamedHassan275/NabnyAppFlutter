

import 'package:get/get.dart';
import 'package:nabny/repositries/repositries_status.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

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

  checkMobilePhone(String phone) async{
    var Resposne = await MyServiceApi.checkMobileByForgetPassword2(phone);
    if (Resposne is SUCCESS){
      setCheckMobileModel(Resposne.response as CheckMobileModel);
    }else if (Resposne is Failure){
      setErrorResponse(Resposne.errorResponse.toString());
    }
  }

}