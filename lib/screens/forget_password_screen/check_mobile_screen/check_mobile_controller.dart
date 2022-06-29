

import 'package:get/get.dart';
import 'package:nabny/repositries/repositries_status.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

import '../../../core/constant/constant.dart';
import '../../../model/check_mobile_user_model.dart';

class CheckMobileController extends GetxController {

  bool isLoading = false;
  CheckMobileUserModel? checkMobileModel;
  String? errorResponse;

  bool? get isloading => isLoading;
  CheckMobileUserModel? get _checkMobileModel => checkMobileModel;
  String? get _errorResponse => errorResponse;

  setLoading(bool isloading){
    isLoading = isloading;
  }

  setCheckMobileModel (CheckMobileUserModel _checkMobileModel){
    checkMobileModel = _checkMobileModel;
    update();
  }
  setErrorResponse (String _errorResponse){
    errorResponse = _errorResponse;
  }

  checkMobilePhone(String phone) async{
    var Resposne = await MyServiceApi.checkMobileByForgetPassword(phone);
    if (Resposne is SUCCESS){
      setCheckMobileModel(Resposne.response as CheckMobileUserModel);
    }else if (Resposne is Failure){
      setErrorResponse(Resposne.errorResponse.toString());
    }
  }

}