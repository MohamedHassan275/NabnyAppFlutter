
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/setting_screen/setting_controller.dart';

import '../../core/localization/local_controller.dart';
import '../../core/servies/storage_service.dart';
import '../../utils/Themes.dart';
import '../setting_screen/setting_screen.dart';

class AboutAppScreen extends StatefulWidget {
   AboutAppScreen({Key? key}) : super(key: key);

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(Get.find<StorageService>().activeLocale.languageCode);
    Get.lazyPut(()=> SettingController());
  }
  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    String? TermsValue = 'لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه … بروشور او فلاير على سبيل المثال … او نماذج مواقع انترنت';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 119,
                    decoration: BoxDecoration(
                        color: Themes.ColorApp14,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Center(
                      child: Text(
                        'about_app'.tr,
                        style: TextStyle(
                          color: Themes.ColorApp15,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: heightValue * 2.3,
                    right: heightValue * 1.5,
                    child: GestureDetector(
                      onTap: ()=>Get.off(HomeMainScreen(valueBack: 'setting')),
                      child: CircleAvatar(
                        backgroundColor: Themes.ColorApp5,
                        child: Icon(
                          Get.find<StorageService>().activeLocale.languageCode == "en" ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                          color: Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: heightValue * 1,
              ),
              GetBuilder<SettingController>(
                init: SettingController(),
                  builder: (controller) {
                    var List = controller.settingResponseModel?.about;
                    var stringList = List!.join(",");
                  print("listView is ${controller.settingResponseModel?.about?.length}");
                  return SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight:  Radius.circular(15))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('about_app'.tr,
                              style: TextStyle(
                                color: Themes.ColorApp1,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: heightValue * 1.5,),
                            Text("${stringList}",
                              style: TextStyle(
                                color: Themes.ColorApp2,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
