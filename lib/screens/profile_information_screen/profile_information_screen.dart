import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/core/widget/custom_circler_progress_indicator_widget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/profile_user_model.dart';
import 'package:nabny/screens/profile_information_screen/profile_information_controller.dart';
import 'package:nabny/screens/setting_profile_screen/setting_profile_screen.dart';
import 'package:nabny/utils/Themes.dart';

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
  final ImagePicker _picker = ImagePicker();
  File? image;

  Future PickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final iamgeTempoary = File(image.path);
      setState(() => this.image = iamgeTempoary);
    } on PlatformException catch (e) {
      print('failed to pick image $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut(() => ProfileInformationController());
  }

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: GetBuilder<ProfileInformationController>(
          builder: (controller) => Container(
            width: Get.width,
            height: Get.height,
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 119,
                        width: Get.width,
                        decoration: const BoxDecoration(
                            color: Themes.ColorApp14,
                            borderRadius: const BorderRadius.only(
                                topRight: const Radius.circular(25),
                                topLeft: Radius.circular(25))),
                        child: Center(
                          child: Text(
                            'account_information'.tr,
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
                        right: widthValue * 1.5,
                        child: GestureDetector(
                          onTap: () => Get.off(SettingProfileScreen()),
                          child: CircleAvatar(
                            backgroundColor: Themes.ColorApp5,
                            child: Icon(
                              Get.find<StorageService>()
                                          .activeLocale
                                          .languageCode ==
                                      "en"
                                  ? Icons.keyboard_arrow_right
                                  : Icons.keyboard_arrow_left,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: heightValue * 1.5,
                  ),
                  controller.ProfileUserModel!.image != null
                      ? Stack(
                          children: [
                            image != null
                                ? GestureDetector(
                                    onTap: () => PickImage(),
                                    child: ClipOval(
                                      child: Image.file(
                                        image!,
                                        width: 137,
                                        height: 137,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () => PickImage(),
                                    child: ClipOval(
                                      child: FadeInImage(
                                        image: NetworkImage(
                                            '${controller.ProfileUserModel!.image}'),
                                        fit: BoxFit.fill,
                                        height: 137,
                                        width: 137,
                                        placeholder: AssetImage(
                                            Assets.imagesFactoryImage),
                                      ),
                                    ),
                                  ),
                            Positioned(
                              bottom: heightValue * .3,
                              right: widthValue * 1,
                              child: Image.asset(
                                Assets.imagesEditIamge,
                                fit: BoxFit.cover,
                                width: 35,
                                height: 35,
                              ),
                            )
                          ],
                        )
                      : Stack(
                          children: [
                            image != null
                                ? GestureDetector(
                              onTap: () => PickImage(),
                                    child: ClipOval(
                                      child: Image.file(
                                        image!,
                                        width: 137,
                                        height: 137,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () => PickImage(),
                                    child: CircleAvatar(
                                      backgroundColor: Themes.ColorApp1,
                                      radius: 75,
                                      child: ClipOval(
                                        child: Image.asset(
                                          Assets.imagesImageLogoApp,
                                          fit: BoxFit.fill,
                                          color: Themes.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                            Positioned(
                              bottom: heightValue * .3,
                              right: widthValue * 1,
                              child: Image.asset(
                                Assets.imagesEditIamge,
                                fit: BoxFit.cover,
                                width: 35,
                                height: 35,
                              ),
                            )
                          ],
                        ),
                  SizedBox(
                    height: heightValue * 1.5,
                  ),
                  UserDetailsWidget(
                    profileUserResponseModel: controller.profileUserModel,
                    heightValue: heightValue,
                    widthValue: widthValue,
                    FirstName: FirstName,
                    LastName: LastName,
                    Email: EmailAddress,
                  ),
                  SizedBox(
                    height: heightValue * 2.5,
                  ),
                  CirclerProgressIndicatorWidget(
                      isLoading: controller.isLoading ? true : false),
                  SizedBox(
                    height: heightValue * 1,
                  ),
                  CustomButtonImage(
                      title: 'save'.tr,
                      hight: 50,
                      onTap: () => Get.find<ProfileInformationController>()
                          .updateProfileUser(
                              FirstName.text,
                              LastName.text,
                              EmailAddress.text,
                              '',
                              Get.find<StorageService>().GetToken))
                ],
              ),
            ),
          ),
        ),
      )),
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
            SizedBox(
              height: heightValue * 1.5,
            ),
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
            SizedBox(
              height: heightValue * 1,
            ),
            Column(
              children: [
                SizedBox(
                  height: heightValue * .5,
                ),
                CustomButtonWithImage(
                  title: 'pick_gallery'.tr,
                  hight: 50,
                  onTap: () {},
                  icon: Icons.image_outlined,
                ),
                SizedBox(
                  height: heightValue * 1.2,
                ),
                CustomButtonWithImage(
                  title: 'pick_camera'.tr,
                  hight: 50,
                  onTap: () {},
                  icon: Icons.camera_alt_outlined,
                ),
                SizedBox(
                  height: heightValue * .7,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserDetailsWidget extends StatelessWidget {
  ProfileUserResponseModel? profileUserResponseModel;
  double heightValue, widthValue;
  TextEditingController FirstName, LastName, Email;

  UserDetailsWidget(
      {required this.profileUserResponseModel,
      required this.FirstName,
      required this.LastName,
      required this.Email,
      required this.widthValue,
      required this.heightValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FromTextProfileShared(
                    labelText: profileUserResponseModel?.firstname == null
                        ? ''
                        : '${profileUserResponseModel?.firstname}',
                    isPassword: false,
                    onTapValidator: (value) {
                      if (value!.isEmpty) {
                        return 'must_not_empty'.tr;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    Controller: FirstName,
                    hintText: '${profileUserResponseModel?.firstname}'),
              ),
              SizedBox(
                height: widthValue * 1.5,
              ),
              Expanded(
                child: FromTextProfileShared(
                    labelText: profileUserResponseModel?.lastname == null
                        ? ''
                        : '${profileUserResponseModel?.lastname}',
                    onTapValidator: (value) {
                      if (value!.isEmpty) {
                        return 'must_not_empty'.tr;
                      }
                      return null;
                    },
                    isPassword: false,
                    keyboardType: TextInputType.text,
                    Controller: LastName,
                    hintText: '${profileUserResponseModel?.lastname}'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightValue * 1,
        ),
        FromTextRegisterShared(
            labelText: profileUserResponseModel?.email == null
                ? ''
                : '${profileUserResponseModel?.email}',
            readOnly: false,
            onTapValidator: (value) {
              if (value!.isEmpty) {
                return 'must_not_empty'.tr;
              } else if (!(value.contains("@"))) {
                return 'not_valid'.tr;
              }
              return null;
            },
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
            Controller: Email,
            hintText: '${profileUserResponseModel?.email}'),
      ],
    );
  }
}
