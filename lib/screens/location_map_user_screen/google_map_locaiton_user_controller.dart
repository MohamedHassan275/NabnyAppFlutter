import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

class GetMyLocationController extends GetxController {
  bool isLoading = false;

  void setSeving(bool saving) {
    isLoading = saving;
    update();
  }

  Future<void> updateMyLocationFromMap(lat, lng, myLocation) async {
    // 1. التأكد من وجود البيانات قبل الإرسال
    if (lat == null || lng == null) {
      CustomFlutterToast('يرجى تحديد الموقع على الخريطة أولاً');
      return;
    }

    setSeving(true);

    try {
      // 2. إضافة Token واللغة من الـ Storage
      String token = 'Bearer ${Get.find<StorageService>().GetToken}';
      String lang = Get.find<StorageService>().activeLocale.languageCode;

      // 3. استدعاء الـ API مع معالجة الوقت المستغرق (Timeout)

      final value = await MyServiceApi.updateMyLocationInMap(
        token,
        lang,
        lat, // تحويل الإحداثيات لنصوص
        lng,
        myLocation,
      ).timeout(const Duration(seconds: 15));

      if (value?.success == true) {
        setSeving(false);
        CustomFlutterToast('${value?.message}');
        Get.offAll(() => HomeMainScreen(valueBack: ''));
      } else {
        setSeving(false);
        // التعديل هنا: اطبع الـ value في الـ console لترى محتواه الحقيقي
        print("Server Response: ${value?.message}");
        print("Server Success Status: ${value?.success}");
        print("Server Success Status: ${value?.toJson()}");

        // إظهار رسالة السيرفر الحقيقية مهما كانت
        CustomFlutterToast(value?.message ?? "السيرفر لم يرسل رسالة خطأ");
      }
    } catch (e) {
      // 4. هنا يتم اصطياد خطأ Failed host lookup أو ضعف الإنترنت
      setSeving(false);
      print("Error in updateMyLocationFromMap: $e");

      if (e.toString().contains("host lookup")) {
        CustomFlutterToast('خطأ في الاتصال بالسيرفر، تأكد من الإنترنت');
      } else {
        CustomFlutterToast('حدث خطأ غير متوقع، حاول لاحقاً');
      }
    }
  }
}
