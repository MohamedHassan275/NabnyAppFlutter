import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut(()=>ProfileInformationController());
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
                              Get.find<StorageService>().GetLanguage == "en"
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
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Themes.ColorApp16,
                        radius: 75,
                        child: ClipOval(
                          child: Image.asset(
                            Assets.imagesFactoryImage,
                            fit: BoxFit.cover,
                            width: 137,
                            height: 137,
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
                  CirclerProgressIndicatorWidget(isLoading: controller.isLoading ? true : false),
                  SizedBox(
                    height: heightValue * 1,
                  ),
                  CustomButtonImage(
                      title: 'save'.tr,
                      hight: 50,
                      onTap: () => Get.find<ProfileInformationController>().updateProfileUser(FirstName.text, LastName.text, EmailAddress.text,
                          '', Get.find<StorageService>().GetToken))
                ],
              ),
            ),
          ),
        ),
      )),
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
            children: [
              Expanded(
                child: FromTextProfileShared(
                    labelText: profileUserResponseModel?.firstname == null ? '' : '${profileUserResponseModel?.firstname}',
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
                    labelText: profileUserResponseModel?.lastname == null ? '' : '${profileUserResponseModel?.lastname}',
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
            labelText: profileUserResponseModel?.email == null ? '' : '${profileUserResponseModel?.email}',
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
