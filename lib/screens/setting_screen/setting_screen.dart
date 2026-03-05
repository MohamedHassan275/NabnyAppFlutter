import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/about_app_screen/about_app_screen.dart';
import 'package:nabny/screens/home_main_screen/home_main_controller.dart';
import 'package:nabny/screens/my_address_screen/my_arddress_screen.dart';
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
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => SettingController());
  }

  @override
  Widget build(BuildContext context) {
    final heightValue = Get.height * 0.024;

    return Scaffold(
      backgroundColor: Themes.ColorApp7,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── هيدر الشاشة ──
              _SettingHeader(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // ── قسم الحساب ──
                    _SectionTitle(label: 'my_account'.tr, icon: Icons.manage_accounts_rounded),
                    const SizedBox(height: 10),
                    _SettingRowItem(
                      icon: Icons.person_outline_rounded,
                      iconBgColor: Themes.ColorApp1,
                      title: 'profile_setting'.tr,
                      subtitle: 'edit_profile_info'.tr,
                      onTap: () => Get.to(() => SettingProfileScreen()),
                    ),
                    const SizedBox(height: 10),
                    _SettingRowItem(
                      icon: Icons.account_balance_wallet_outlined,
                      iconBgColor: const Color(0xFF4CAF50),
                      title: 'wallet'.tr,
                      subtitle: 'manage_wallet'.tr,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _SettingRowItem(
                      icon: Icons.location_on_outlined,
                      iconBgColor: Themes.ColorApp9,
                      title: 'my_addresses'.tr,
                      subtitle: 'manage_addresses'.tr,
                      onTap: () => Get.to(const MyAddressScreen()),
                    ),

                    const SizedBox(height: 20),

                    // ── قسم التطبيق ──
                    _SectionTitle(label: 'app_settings'.tr, icon: Icons.settings_outlined),
                    const SizedBox(height: 10),
                    _SettingRowItem(
                      icon: Icons.language_rounded,
                      iconBgColor: const Color(0xFF2196F3),
                      title: 'language'.tr,
                      subtitle: Get.locale?.languageCode == 'ar' ? 'العربية' : 'English',
                      onTap: () {
                        Get.bottomSheet(
                          ChangeLanguageBottomSheetItem(heightValue: heightValue),
                          backgroundColor: Themes.whiteColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                          ),
                          elevation: 2.0,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    _SettingRowItem(
                      icon: Icons.info_outline_rounded,
                      iconBgColor: const Color(0xFF9C27B0),
                      title: 'about_app'.tr,
                      subtitle: 'learn_about_app'.tr,
                      onTap: () => Get.to(AboutAppScreen()),
                    ),
                    const SizedBox(height: 10),
                    _SettingRowItem(
                      icon: Icons.share_outlined,
                      iconBgColor: const Color(0xFFFF9800),
                      title: 'share_app'.tr,
                      subtitle: 'share_with_friends'.tr,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _SettingRowItem(
                      icon: Icons.article_outlined,
                      iconBgColor: const Color(0xFF607D8B),
                      title: 'terms_and_conditions'.tr,
                      subtitle: 'read_terms'.tr,
                      onTap: () => Get.to(TermsConditionScreen()),
                    ),
                    const SizedBox(height: 10),
                    _SettingRowItem(
                      icon: Icons.lock_outline_rounded,
                      iconBgColor: const Color(0xFF795548),
                      title: 'privacy_policy'.tr,
                      subtitle: 'read_privacy'.tr,
                      onTap: () => Get.to(PrivacyScreen()),
                    ),

                    const SizedBox(height: 20),

                    // ── قسم التواصل ──
                    _SectionTitle(label: 'to_communicate'.tr, icon: Icons.headset_mic_outlined),
                    const SizedBox(height: 10),
                    ContactWithUs(heightValue: heightValue, widthValue: heightValue),

                    const SizedBox(height: 20),

                    // ── زر تسجيل الخروج ──
                    GetBuilder<HomeMainController>(
                      builder: (ctrl) => Column(
                        children: [
                          if (ctrl.isLogout)
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: CircularProgressIndicator(),
                            ),
                          GestureDetector(
                            onTap: () => ctrl.logoutUser(
                              'Bearer ' + Get.find<StorageService>().GetToken,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF0F0),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Themes.ColorApp9.withOpacity(0.4),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.power_settings_new_rounded,
                                      color: Themes.ColorApp9, size: 22),
                                  const SizedBox(width: 10),
                                  Text(
                                    'log_out'.tr,
                                    style: TextStyle(
                                      color: Themes.ColorApp9,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── هيدر الإعدادات ──
class _SettingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeMainController>(
      init: HomeMainController(),
      builder: (controller) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Themes.ColorApp1,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          bottom: 30,
          left: 24,
          right: 24,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white.withOpacity(0.15),
                child: ClipOval(
                  child: Image.asset(
                    Assets.imagesImageLogoApp,
                    fit: BoxFit.contain,
                    color: Colors.white,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.profileUserModel?.firstname != null
                        ? '${controller.profileUserModel?.firstname} ${controller.profileUserModel?.lastname}'
                        : '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    controller.profileUserModel?.phone != null
                        ? '${controller.profileUserModel?.phone}'
                        : '',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── عنوان القسم ──
class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Themes.ColorApp1, size: 20),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: Themes.ColorApp1,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

// ── عنصر قائمة إعداد واحد ──
class _SettingRowItem extends StatelessWidget {
  const _SettingRowItem({
    required this.icon,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Themes.ColorApp14, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBgColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconBgColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Themes.ColorApp15,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Themes.ColorApp8.withOpacity(0.7),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Get.locale?.languageCode == 'ar'
                  ? Icons.arrow_back_ios_rounded
                  : Icons.arrow_forward_ios_rounded,
              color: Themes.ColorApp11,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

// ── \u0642\u0633\u0645 \u0627\u0644\u062a\u0648\u0627\u0635\u0644 \u0645\u0639\u0646\u0627 ──
class ContactWithUs extends StatelessWidget {
  ContactWithUs({required this.heightValue, required this.widthValue});

  double? heightValue, widthValue;

  Future<void> _launchURL(String? url) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> launchWhatsApp({required String phone, String message = ""}) async {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');
    final whatsappUrl =
        "whatsapp://send?phone=$cleanPhone&text=${Uri.encodeComponent(message)}";
    final webUrl = "https://wa.me/$cleanPhone";

    try {
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(Uri.parse(whatsappUrl),
            mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(webUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print("Could not launch WhatsApp: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (controller) => Row(
        children: [
          _ContactCardItem(
            imageTitle: Assets.iconsWhatsUpImage,
            label: 'WhatsApp',
            color: const Color(0xFF25D366),
            onTap: () => launchWhatsApp(
              phone:
                  controller.settingResponseModel?.socialmedia?[0].whatsapp ?? '',
              message: "\u0627\u0644\u0633\u0644\u0627\u0645 \u0639\u0644\u064a\u0643\u0645\u0601 \u0623\u0631\u064a\u062f \u0627\u0644\u0627\u0633\u062a\u0641\u0633\u0627\u0631 \u0639\u0646...",
            ),
          ),
          const SizedBox(width: 10),
          _ContactCardItem(
            imageTitle: Assets.iconsInstagramImage,
            label: 'Instagram',
            color: const Color(0xFFE1306C),
            onTap: () => _launchURL(
                controller.settingResponseModel?.socialmedia?[0].instagram),
          ),
          const SizedBox(width: 10),
          _ContactCardItem(
            imageTitle: Assets.iconsTwitterImage,
            label: 'Twitter',
            color: const Color(0xFF1DA1F2),
            onTap: () => _launchURL(
                controller.settingResponseModel?.socialmedia?[0].twitter),
          ),
          const SizedBox(width: 10),
          _ContactCardItem(
            imageTitle: Assets.iconsSnapshatImage,
            label: 'Snapchat',
            color: const Color(0xFFFFFC00),
            onTap: () => _launchURL(
                controller.settingResponseModel?.socialmedia?[0].snapchat),
          ),
        ],
      ),
    );
  }
}

// \u2500\u2500 \u0628\u0632\u0627\u0642\u0629 \u062a\u0648\u0627\u0635\u0644 \u0648\u0627\u062d\u062f\u0629 (\u0645\u062d\u0633\u0651\u0646\u0629 \u0645\u0639 \u0644\u0648\u0646 \u0627\u0644\u0645\u0646\u0635\u0629) \u2500\u2500
class _ContactCardItem extends StatelessWidget {
  const _ContactCardItem({
    required this.imageTitle,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String imageTitle;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.12),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(color: color.withOpacity(0.25), width: 1),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    imageTitle,
                    width: 26,
                    height: 26,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  color: color.withOpacity(0.85),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Bottom Sheet تغيير اللغة ──
class ChangeLanguageBottomSheetItem extends StatefulWidget {
  final double? heightValue;
  const ChangeLanguageBottomSheetItem({Key? key, required this.heightValue}) : super(key: key);

  @override
  State<ChangeLanguageBottomSheetItem> createState() =>
      _ChangeLanguageBottomSheetItemState();
}

class _ChangeLanguageBottomSheetItemState
    extends State<ChangeLanguageBottomSheetItem> {
  MyLocalController myLocalController = Get.put(MyLocalController());

  @override
  Widget build(BuildContext context) {
    final currentLocale = Get.locale?.languageCode ?? 'ar';

    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // مقبض السحب
          Container(
            width: 45,
            height: 5,
            decoration: BoxDecoration(
              color: Themes.ColorApp11.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'chose_language'.tr,
            style: const TextStyle(
              color: Themes.ColorApp15,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 24),
          
          // العربية
          _LanguageOption(
            title: 'arabic'.tr,
            isSelected: currentLocale == 'ar',
            flag: '🇸🇦',
            onTap: () {
              myLocalController.changelanguage("ar");
              Get.offAll(const SplashScreen());
            },
          ),
          
          const SizedBox(height: 12),
          
          // الإنجليزية
          _LanguageOption(
            title: 'english'.tr,
            isSelected: currentLocale == 'en',
            flag: '🇺🇸',
            onTap: () {
              myLocalController.changelanguage("en");
              Get.offAll(const SplashScreen());
            },
          ),
          
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final String flag;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.title,
    required this.isSelected,
    required this.flag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Themes.ColorApp1.withOpacity(0.06) : const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? Themes.ColorApp1 : Themes.ColorApp14,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: isSelected ? Themes.ColorApp1 : Themes.ColorApp15,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle_rounded, color: Themes.ColorApp1, size: 24)
            else
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Themes.ColorApp11.withOpacity(0.4), width: 2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
