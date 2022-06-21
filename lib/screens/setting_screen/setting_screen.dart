import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/about_app_screen/about_app_screen.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/privacy_screen/privacy_screen.dart';
import 'package:nabny/screens/setting_profile_screen/setting_profile_screen.dart';
import 'package:nabny/screens/splash_screen/screen_screen.dart';
import 'package:nabny/screens/terms_condition_screen/terms_condition_screen.dart';

import '../../utils/Themes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}



class _SettingScreenState extends State<SettingScreen> {

  String _genderRadioBtnVal = "العربية";

  void _handleGenderChange(String? value) {
    setState(() {
      _genderRadioBtnVal = value!;
      print(_genderRadioBtnVal);
    });
  }

    @override
    Widget build(BuildContext context) {
      var widthValue = Get.width * 0.024;
      var heightValue = Get.height * 0.024;
      MyLocalController myLocalController = Get.put(MyLocalController());
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightValue * 1.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SettingCategory(
                                  onTap: () {},
                                  title: 'مشاركة التطبيق',
                                  imageTitle: Assets.iconsShare,
                                  heightValue: heightValue),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              SettingCategory(
                                  onTap: () => Get.to(const PrivacyScreen()),
                                  title: 'الشروط والاحكام',
                                  imageTitle: Assets.iconsTermsConditionsImage,
                                  heightValue: heightValue),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              SettingCategory(
                                  onTap: () =>
                                      Get.to(const TermsConditionScreen()),
                                  title: 'سياسه الخصوصيه',
                                  imageTitle: Assets.iconsPrivacyImage,
                                  heightValue: heightValue),
                            ],
                          ),
                          SizedBox(
                            height: heightValue * 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SettingCategory(
                                  onTap: () {
                                    Get.bottomSheet(
                                      ChangeLanguageBottomSheetItem(myLocalController: myLocalController, heightValue: heightValue),
                                      backgroundColor: Themes.whiteColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: const Radius.circular(
                                                  25))),
                                      elevation: 2.0,
                                    );
                                  },
                                  title: 'اللغه',
                                  imageTitle: Assets.iconsLanguageImage,
                                  heightValue: heightValue),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              SettingCategory(
                                  onTap: () =>
                                      Get.off(const SettingProfileScreen()),
                                  title: 'اعدادات البروفايل',
                                  imageTitle: Assets.iconsProfileMenuIcon,
                                  heightValue: heightValue),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              SettingCategory(
                                  onTap: () => Get.to(const AboutAppScreen()),
                                  title: 'عن التطبيق',
                                  imageTitle: Assets.imagesAboutAppImage,
                                  heightValue: heightValue),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightValue * 1,
                    ),
                    const Divider(height: 10, color: Themes.ColorApp8),
                    SizedBox(
                      height: heightValue * 1,
                    ),
                    ContactWithUs(
                        heightValue: heightValue, widthValue: widthValue),
                  ],
                ),
              ),
            )),
      );
    }
  }


class SettingCategory extends StatelessWidget {
  SettingCategory(
      {required this.onTap,
      required this.title,
      required this.imageTitle,
      required this.heightValue});

  double? heightValue;
  String? imageTitle, title;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: Get.width,
          height: 135,
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: 100,
                decoration: BoxDecoration(
                    color: Themes.ColorApp14,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Image.asset(imageTitle!, fit: BoxFit.contain)),
              ),
              SizedBox(
                height: heightValue! * .5,
              ),
              Text(
                title!,
                style: const TextStyle(
                  color: Themes.ColorApp8,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactWithUs extends StatelessWidget {
  ContactWithUs({required this.heightValue, required this.widthValue});

  double? heightValue, widthValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'للتواصل',
            style: TextStyle(
              color: Themes.ColorApp8,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: heightValue! * 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactWithUsItem(
                imageTitle: Assets.iconsWhatsUpImage,
                onTap: () {},
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsInstagramImage,
                onTap: () {},
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsTwitterImage,
                onTap: () {},
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsSnapshatImage,
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ChangeLanguageBottomSheetItem extends StatelessWidget {
  double? heightValue;
  MyLocalController myLocalController;
  ChangeLanguageBottomSheetItem({required this.myLocalController, required this.heightValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 325,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                width: Get.width,
                height: 5,
                decoration: BoxDecoration(
                    color: Themes.ColorApp11,
                    borderRadius:
                    BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: heightValue! * 2,
            ),
            Text(
              'تغير اللغة',
              style: TextStyle(
                color: Themes.ColorApp1,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: heightValue! * 1,
            ),
            Column(
              children: <Widget>[
                CustomButtonImage(
                    title: 'arabic'.tr,
                    hight: 50,
                    onTap: (){
                      myLocalController.changelanguage("ar");
                      Get.offAll(const SplashScreen());
                    }),
                SizedBox(height: heightValue! * 1,),
                CustomButtonImage(
                    title: 'english'.tr,
                    hight: 50,
                    onTap: (){
                      myLocalController.changelanguage("en");
                      Get.offAll(const SplashScreen());
                    })
              ],
            ),
            SizedBox(
              height: heightValue! * 1.5,
            ),
          ],
        ),
      ),
    );
  }
}

class ContactWithUsItem extends StatelessWidget {
  ContactWithUsItem({required this.onTap, required this.imageTitle});

  String? imageTitle;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: Get.width,
          height: 75,
          decoration: BoxDecoration(
              color: Themes.ColorApp14,
              borderRadius: BorderRadius.circular(15)),
          child: Center(child: Image.asset(imageTitle!, fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
