
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/screens/setting_screen/setting_screen.dart';

import '../../core/servies/storage_service.dart';
import '../../utils/Themes.dart';
import '../home_main_screen/home_main_screen.dart';
import '../setting_screen/setting_controller.dart';

class TermsConditionScreen extends StatefulWidget {
  TermsConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut(() => SettingController());
    Get.put(MyLocalController());
  }

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
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
                        'terms_and_conditions'.tr,
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
                          Get.find<StorageService>().activeLocale.languageCode == "en"
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left,
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
                 builder: (controller)=> Container(
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
                       Text('terms_and_conditions'.tr,
                         style: TextStyle(
                           color: Themes.ColorApp1,
                           fontSize: 17,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                       SizedBox(height: heightValue * 1.5,),
                       Text("${controller.settingResponseModel!.policy!.policy}",
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
             ))
            ],
          ),
        ),
      ),
    );
  }
}
