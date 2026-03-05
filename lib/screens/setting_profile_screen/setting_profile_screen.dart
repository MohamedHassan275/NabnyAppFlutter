
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/screens/profile_information_screen/profile_information_screen.dart';
import 'package:nabny/utils/Themes.dart';

/// شاشة إعدادات الملف الشخصي - تعيد توجيه مباشرة لشاشة معلومات الحساب
class SettingProfileScreen extends StatelessWidget {
  SettingProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // التوجيه المباشر لشاشة معلومات الحساب
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.off(() => ProfileInformationScreen());
    });
    // شاشة بيضاء مؤقتة حتى يتم التوجيه
    return const Scaffold(
      backgroundColor: Themes.ColorApp7,
      body: Center(
        child: CircularProgressIndicator(color: Themes.ColorApp1),
      ),
    );
  }
}
