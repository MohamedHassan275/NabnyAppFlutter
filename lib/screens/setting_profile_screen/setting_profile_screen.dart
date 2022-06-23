
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/change_password_profile/change_password_profile.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/profile_information_screen/profile_information_screen.dart';
import 'package:nabny/utils/Themes.dart';

class SettingProfileScreen extends StatelessWidget {
   SettingProfileScreen({Key? key}) : super(key: key);

   MyLocalController myLocalController = Get.put(MyLocalController());
  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 119,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Themes.ColorApp14,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25))
                      ),
                      child: Center(
                        child: Text(
                          'profile_setting'.tr,
                          style: TextStyle(
                            color: Themes.ColorApp15,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: heightValue * 2.3,
                      right: myLocalController.language!.languageCode == "ar" ? widthValue * 1.5 : 0,
                      left: myLocalController.language!.languageCode == "en" ? widthValue * 1.5 : 0,
                      child: GestureDetector(
                        onTap: ()=>Get.off(HomeMainScreen(valueBack: 'setting')),
                        child: CircleAvatar(
                          backgroundColor: Themes.ColorApp5,
                          child: Icon(
                           myLocalController.language!.languageCode == "ar" ? Icons.subdirectory_arrow_right : Icons.subdirectory_arrow_left,
                            color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: heightValue * 1.5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: ()=> Get.off(ProfileInformationScreen()),
                    child: Container(
                      height: 70,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Themes.ColorApp14,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Themes.whiteColor,
                                child: Image.asset(Assets.iconsProfileMenuIcon,width: 25,height: 25,),
                              ),
                              SizedBox(width: widthValue * 1,),
                              Text(
                                'account_information'.tr,
                                style: TextStyle(
                                  color: Themes.ColorApp15,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: heightValue * 1,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: ()=> Get.to(ChangePasswordProfile()),
                    child: Container(
                      height: 70,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Themes.ColorApp14,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Themes.whiteColor,
                                child: Icon(Icons.lock_outline,color: Themes.ColorApp1,)
                              ),
                              SizedBox(width: widthValue * 1,),
                              Text(
                                'change_password'.tr,
                                style: TextStyle(
                                  color: Themes.ColorApp15,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
