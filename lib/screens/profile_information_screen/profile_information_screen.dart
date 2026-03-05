import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/model/profile_user_model.dart';
import 'package:nabny/screens/change_password_profile/change_password_profile.dart';
import 'package:nabny/screens/profile_information_screen/profile_information_controller.dart';
import 'package:nabny/utils/Themes.dart';
import 'package:nabny/generated/assets.dart';
import '../../componant/CustomTextFieldWidget.dart';
import '../../core/servies/storage_service.dart';

class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({Key? key}) : super(key: key);

  @override
  _ProfileInformationScreenState createState() =>
      _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController EmailAddress = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => ProfileInformationController());
  }

  @override
  Widget build(BuildContext context) {
    final isAr = Get.locale?.languageCode == 'ar';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<ProfileInformationController>(
          builder: (controller) {
            FirstName.text = controller.ProfileUserModel?.firstname ?? '';
            LastName.text = controller.ProfileUserModel?.lastname ?? '';
            EmailAddress.text = controller.ProfileUserModel?.email ?? '';

            return Column(
              children: [
                // ── رأس الصفحة (Header) ──
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // زر الرجوع
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Themes.ColorApp1.withOpacity(0.08),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isAr ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded,
                            color: Themes.ColorApp1,
                            size: 20,
                          ),
                        ),
                      ),
                      // عنوان الشاشة
                      Text(
                        'account_information'.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Themes.ColorApp15,
                        ),
                      ),
                      const SizedBox(width: 42), // للحفاظ على التوازن
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),

                        // ── صورة البروفايل ──
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                BottomSheetItem(),
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Themes.ColorApp4,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Themes.ColorApp14, width: 2),
                                    image: DecorationImage(
                                      image: controller.ProfileUserModel?.image != null
                                          ? NetworkImage(controller.ProfileUserModel!.image!)
                                          : const AssetImage(Assets.imagesImageLogoApp) as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 4,
                                  right: 4,
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Themes.ColorApp1,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 2),
                                    ),
                                    child: const Icon(Icons.edit_rounded, color: Colors.white, size: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // ── حقول البيانات ──
                        Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: isAr ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // الاسم الأول
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: isAr ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'first_name'.tr,
                                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Themes.ColorApp15),
                                        ),
                                        const SizedBox(height: 8),
                                        FromTextProfileShared(
                                          isPassword: false,
                                          onTapValidator: (val) => val!.isEmpty ? 'must_not_empty'.tr : null,
                                          onChanged: (val) => controller.ProfileUserModel?.firstname = val,
                                          keyboardType: TextInputType.text,
                                          Controller: FirstName,
                                          hintText: 'first_name'.tr,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // اسم العائلة
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: isAr ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'last_name'.tr,
                                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Themes.ColorApp15),
                                        ),
                                        const SizedBox(height: 8),
                                        FromTextProfileShared(
                                          isPassword: false,
                                          onTapValidator: (val) => val!.isEmpty ? 'must_not_empty'.tr : null,
                                          onChanged: (val) => controller.ProfileUserModel?.lastname = val,
                                          keyboardType: TextInputType.text,
                                          Controller: LastName,
                                          hintText: 'last_name'.tr,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              // البريد الإلكتروني
                              Text(
                                'email'.tr,
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Themes.ColorApp15),
                              ),
                              const SizedBox(height: 8),
                              FromTextRegisterShared(
                                readOnly: false,
                                onTapValidator: (val) {
                                  if (val!.isEmpty) return 'must_not_empty'.tr;
                                  if (!val.contains('@')) return 'not_valid'.tr;
                                  return null;
                                },
                                isPassword: false,
                                keyboardType: TextInputType.emailAddress,
                                Controller: EmailAddress,
                                hintText: 'email'.tr,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // ── رابط تغيير كلمة المرور ──
                        Align(
                          alignment: isAr ? Alignment.centerRight : Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () => Get.to(ChangePasswordProfile()),
                            child: Text(
                              'change_password'.tr,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Themes.ColorApp1,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ── زر الحفظ ──
                        if (controller.isLoading)
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: CircularProgressIndicator(),
                          ),
                        CustomButtonImage(
                          title: 'save'.tr,
                          hight: 54,
                          onTap: () {
                            controller.updateProfileUser(
                              FirstName.text.isEmpty ? controller.ProfileUserModel!.firstname! : FirstName.text,
                              LastName.text.isEmpty ? controller.ProfileUserModel!.lastname! : LastName.text,
                              EmailAddress.text.isEmpty ? controller.ProfileUserModel!.email! : EmailAddress.text,
                              '',
                              Get.find<StorageService>().GetToken,
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BottomSheetItem extends StatefulWidget {
  BottomSheetItem({Key? key}) : super(key: key);

  @override
  State<BottomSheetItem> createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return SizedBox(
      width: Get.width,
      height: 485,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                width: Get.width,
                height: 5,
                decoration: BoxDecoration(
                    color: Themes.ColorApp11,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: heightValue * 1.5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'chose_photo'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Themes.ColorApp8,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: heightValue * 1),
            Column(
              children: [
                SizedBox(height: heightValue * .5),
                CustomButtonWithImage(
                  title: 'pick_gallery'.tr,
                  hight: 50,
                  onTap: () {},
                  icon: Icons.image_outlined,
                ),
                SizedBox(height: heightValue * 1.2),
                CustomButtonWithImage(
                  title: 'pick_camera'.tr,
                  hight: 50,
                  onTap: () {},
                  icon: Icons.camera_alt_outlined,
                ),
                SizedBox(height: heightValue * .7),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetailsWidget extends StatelessWidget {
  ProfileUserResponseModel? profileUserResponseModel;
  double heightValue, widthValue;
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Email = TextEditingController();

  UserDetailsWidget({
    required this.profileUserResponseModel,
    required this.FirstName,
    required this.LastName,
    required this.Email,
    required this.widthValue,
    required this.heightValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: FromTextProfileShared(
                isPassword: false,
                onTapValidator: (value) {
                  if (value!.isEmpty) return 'must_not_empty'.tr;
                  return null;
                },
                onChanged: (value) {
                  profileUserResponseModel?.firstname = value;
                },
                keyboardType: TextInputType.text,
                Controller: FirstName,
                hintText: profileUserResponseModel?.firstname == null
                    ? ''
                    : '${profileUserResponseModel?.firstname}',
              ),
            ),
            SizedBox(width: widthValue * 1.5),
            Expanded(
              child: FromTextProfileShared(
                onTapValidator: (value) {
                  if (value!.isEmpty) return 'must_not_empty'.tr;
                  return null;
                },
                isPassword: false,
                keyboardType: TextInputType.text,
                Controller: LastName,
                hintText: profileUserResponseModel?.lastname == null
                    ? ''
                    : '${profileUserResponseModel?.lastname}',
              ),
            ),
          ],
        ),
        SizedBox(height: heightValue * 1),
        FromTextRegisterShared(
          readOnly: false,
          onTapValidator: (value) {
            if (value!.isEmpty) return 'must_not_empty'.tr;
            if (!(value.contains('@'))) return 'not_valid'.tr;
            return null;
          },
          isPassword: false,
          keyboardType: TextInputType.emailAddress,
          Controller: Email,
          hintText: profileUserResponseModel?.email == null
              ? ''
              : '${profileUserResponseModel?.email}',
        ),
      ],
    );
  }
}
