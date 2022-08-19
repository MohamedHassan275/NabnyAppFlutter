import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/localization/localization_service.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/about_app_screen/about_app_screen.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/privacy_screen/privacy_screen.dart';
import 'package:nabny/screens/setting_profile_screen/setting_profile_screen.dart';
import 'package:nabny/screens/setting_screen/setting_controller.dart';
import 'package:nabny/screens/splash_screen/splash_screen.dart';
import 'package:nabny/screens/terms_condition_screen/terms_condition_screen.dart';
import 'package:url_launcher/url_launcher.dart';

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

  // void openWhatsApp(String phoneNumber) async {
  //   bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
  //
  //   if (whatsapp) {
  //     await FlutterLaunch.launchWhatsapp(
  //         phone: "$phoneNumber",message: '');
  //   } else {
  //     // setState(() {
  //     //   err = false;
  //     //   msgErr = '';
  //     // });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut(() => SettingController());
    print("lan is ${Get.find<MyLocalController>().language!.languageCode}");
  }
    @override
    Widget build(BuildContext context) {
      var widthValue = Get.width * 0.024;
      var heightValue = Get.height * 0.024;
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: Get.width,
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
                                  title: 'share_app'.tr,
                                  imageTitle: Assets.iconsShare,
                                  heightValue: heightValue),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              SettingCategory(
                                  onTap: () => Get.to(TermsConditionScreen()),
                                  title: 'terms_and_conditions'.tr,
                                  imageTitle: Assets.iconsTermsConditionsImage,
                                  heightValue: heightValue),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              SettingCategory(
                                  onTap: () =>
                                      Get.to(PrivacyScreen()),
                                  title: 'privacy_policy'.tr,
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
                                      ChangeLanguageBottomSheetItem(heightValue: heightValue),
                                      backgroundColor: Themes.whiteColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: const Radius.circular(
                                                  25))),
                                      elevation: 2.0,
                                    );
                                  },
                                  title: 'language'.tr,
                                  imageTitle: Assets.iconsLanguageImage,
                                  heightValue: heightValue),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              SettingCategory(
                                  onTap: () =>
                                      Get.off(SettingProfileScreen()),
                                  title: 'profile_setting'.tr,
                                  imageTitle: Assets.iconsProfileMenuIcon,
                                  heightValue: heightValue),
                              SizedBox(
                                width: widthValue * 1.5,
                              ),
                              SettingCategory(
                                  onTap: () => Get.to(AboutAppScreen()),
                                  title: 'about_app'.tr,
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
        child: SizedBox(
          width: Get.width,
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

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
        builder: (controller) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'to_communicate'.tr,
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
                onTap: () async{
                  bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

                  if (whatsapp) {
                    await FlutterLaunch.launchWhatsapp(
                        phone: controller.settingResponseModel!.socialmedia![0].whatsapp!,message: '');
                  } else {
                    print("Whatsapp não instalado");
                  }
                },
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsInstagramImage,
                onTap: () => _launchURL(controller.settingResponseModel!.socialmedia![0].instagram),
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsTwitterImage,
                onTap: () => _launchURL(controller.settingResponseModel!.socialmedia![0].twitter),
              ),
              SizedBox(
                width: widthValue! * 1.5,
              ),
              ContactWithUsItem(
                imageTitle: Assets.iconsSnapshatImage,
                onTap: () => _launchURL(controller.settingResponseModel!.socialmedia![0].snapchat),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

class ChangeLanguageBottomSheetItem extends StatefulWidget {
  double? heightValue;
  ChangeLanguageBottomSheetItem({required this.heightValue});

  @override
  State<ChangeLanguageBottomSheetItem> createState() => _ChangeLanguageBottomSheetItemState();
}

class _ChangeLanguageBottomSheetItemState extends State<ChangeLanguageBottomSheetItem> {

  // changelanguage(String codeCountry){
  //   Locale myLocal = Locale(codeCountry);
  //   Get.find<StorageService>().activeLocale;
  //   Get.updateLocale(myLocal);
  // }

  MyLocalController myLocalController = Get.put(MyLocalController());

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
              height: widget.heightValue! * 2,
            ),
            Text(
              'chose_language'.tr,
              style: TextStyle(
                color: Themes.ColorApp1,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: widget.heightValue! * 1,
            ),
            Column(
              children: <Widget>[
                CustomButtonImage(
                    title: 'arabic'.tr,
                    hight: 50,
                    onTap: (){
                    setState(() {
                     // changelanguage("ar");
                     // CustomFlutterToast(Get.find<StorageService>().GetLanguage);
                    //  Get.find<LocalizationService>().toggleLocale('ar');
                      myLocalController.changelanguage("ar");
                      print("change lan is ${Get.find<MyLocalController>().language!.languageCode}");
                      Get.offAll(const SplashScreen());
                    });
                    }),
                SizedBox(height: widget.heightValue! * 1,),
                CustomButtonImage(
                    title: 'english'.tr,
                    hight: 50,
                    onTap: (){
                     setState(() {
                     //  Get.find<LocalizationService>().toggleLocale('en');
                     //  CustomFlutterToast(Get.find<StorageService>().GetLanguage);
                       myLocalController.changelanguage("en");
                       print("change lan is ${Get.find<MyLocalController>().language!.languageCode}");
                       Get.offAll(const SplashScreen());
                     });
                    })
              ],
            ),
            SizedBox(
              height: widget.heightValue! * 1.5,
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
