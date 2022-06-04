import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/about_app_screen/about_app_screen.dart';
import 'package:nabny/screens/privacy_screen/privacy_screen.dart';
import 'package:nabny/screens/setting_profile_screen/setting_profile_screen.dart';
import 'package:nabny/screens/terms_condition_screen/terms_condition_screen.dart';

import '../../utils/Themes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: 119,
                decoration: const BoxDecoration(
                    color: Themes.ColorApp14,
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: const Center(
                  child: Text(
                    'الاعدادات',
                    style: TextStyle(
                      color: Themes.ColorApp15,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
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
                            onTap: () => Get.to(const TermsConditionScreen()),
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
                            onTap: () {},
                            title: 'اللغه',
                            imageTitle: Assets.iconsLanguageImage,
                            heightValue: heightValue),
                        SizedBox(
                          width: widthValue * 1.5,
                        ),
                        SettingCategory(
                            onTap: () => Get.off(const SettingProfileScreen()),
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
              ContactWithUs(heightValue: heightValue, widthValue: widthValue),
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
              child:
                  Center(child: Image.asset(imageTitle!, fit: BoxFit.contain)),
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
