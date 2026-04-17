import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/model/profile_user_model.dart';
import 'package:nabny/screens/change_password_profile/change_password_profile.dart';
import 'package:nabny/screens/profile_information_screen/profile_information_controller.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomTextFieldWidget.dart';
import '../../core/servies/storage_service.dart';
import '../../generated/assets.dart';

class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({Key? key}) : super(key: key);

  @override
  _ProfileInformationScreenState createState() => _ProfileInformationScreenState();
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

  File? _selectedImage; // لاستخدام File قم باستيراد 'import 'dart:io';'

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path); // حفظ الصورة المختارة
      });
    }
    Get.back(); // إغلاق الـ BottomSheet
  }

// عند الضغط على أيقونة القلم لتعديل الصورة:
  void openBottomSheet() {
    Get.bottomSheet(
      BottomSheetItem(onPick: (source) => _pickImage(source)),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAr = Get.locale?.languageCode == 'ar';

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ProfileInformationController>(
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
                            onTap: () => openBottomSheet(),
                            child: Stack(
                              children: [
                                Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    // استخدام ألوان الهوية البصرية لـ SoftBridge (الأزرق/الأبيض)
                                    color: controller.ProfileUserModel?.image == null ? Themes.ColorApp1 : Themes.ColorApp4,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Themes.ColorApp14,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: ClipOval(
                                    // هذا الجزء يضمن القص الدائري للصورة
                                    child: _buildProfileImage(imageProfile: controller.ProfileUserModel?.image),
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
                              // الاسم الأول
                              FromTextProfileShared(
                                isPassword: false,
                                onTapValidator: (val) => val!.isEmpty ? 'must_not_empty'.tr : null,
                                onChanged: (val) => controller.ProfileUserModel?.firstname = val,
                                keyboardType: TextInputType.text,
                                Controller: FirstName,
                                hintText: 'first_name'.tr,
                              ),
                              const SizedBox(height: 18),
                              // اسم العائلة
                              FromTextProfileShared(
                                isPassword: false,
                                onTapValidator: (val) => val!.isEmpty ? 'must_not_empty'.tr : null,
                                onChanged: (val) => controller.ProfileUserModel?.lastname = val,
                                keyboardType: TextInputType.text,
                                Controller: LastName,
                                hintText: 'last_name'.tr,
                              ),
                              const SizedBox(height: 18),
                              FromTextProfileShared(
                                readOnly: true,
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

                        const SizedBox(height: 20),

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
    );
  }

  // دالة مساعدة لفصل منطق اختيار الصورة (Refactoring)
  Widget _buildProfileImage({required String? imageProfile}) {
    if (imageProfile != null) {
      return Image.network(
        imageProfile,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.asset(Assets.iconsLogoApp, fit: BoxFit.cover),
      );
    } else if (_selectedImage != null) {
      return Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(Assets.iconsLogoApp, fit: BoxFit.contain),
      );
    }
  }
}

class BottomSheetItem extends StatelessWidget {
  final Function(ImageSource) onPick;

  const BottomSheetItem({Key? key, required this.onPick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)), // زوايا دائرية كبيرة كما في الصورة
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ليأخذ الارتفاع بناءً على المحتوى فقط
        children: [
          // الخط الرمادي العلوي
          Container(
            width: 50,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'chose_photo'.tr, // "Chose photo from"
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOption(
                label: 'pick_gallery'.tr,
                icon: Icons.image_outlined,
                onTap: () => onPick(ImageSource.gallery),
              ),
              _buildOption(
                label: 'pick_camera'.tr,
                icon: Icons.camera_alt_outlined,
                onTap: () => onPick(ImageSource.camera),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildOption({required String label, required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color(0xffe9f2ff), // لون الخلفية الزرقاء الفاتحة
            child: Icon(icon, size: 30, color: const Color(0xff2196F3)),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
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
                hintText: profileUserResponseModel?.firstname == null ? '' : '${profileUserResponseModel?.firstname}',
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
                hintText: profileUserResponseModel?.lastname == null ? '' : '${profileUserResponseModel?.lastname}',
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
          hintText: profileUserResponseModel?.email == null ? '' : '${profileUserResponseModel?.email}',
        ),
      ],
    );
  }
}
