
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/model/companiesModel.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';

class CategoryDetailsController extends GetxController {

  bool Loading = false;
  List<CompaniesResponseModel>? _companiesResponseModel;

  get loading => Loading;
  List<CompaniesResponseModel>?  get companiesResponseModel => _companiesResponseModel;

  setLoading(bool loading){
    Loading = loading;
    update();
  }

  setCategoryDetails(List<CompaniesResponseModel>? companiesResponseModel){
    _companiesResponseModel = companiesResponseModel;
  }

  CategoryDetailsController(categoryId){
    getCategoryDetails(categoryId);
  }
  getCategoryDetails(categoryId){
    setLoading(true);
    MyServiceApi.GetCompaniesDetails(Get.find<StorageService>().GetToken, Get.find<StorageService>().activeLocale.languageCode, categoryId).then((value){
      if (value?.success == true){
        setLoading(false);
        setCategoryDetails(value?.companiesResponseModel);
      }else {
        setLoading(false);
        CustomFlutterToast(value?.message);
      }
    });
  }
}