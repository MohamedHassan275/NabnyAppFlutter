import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/setting_profile_screen/setting_profile_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../componant/CustomTextFieldWidget.dart';

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

  String? firstName, lastName, email;
  var formKey = GlobalKey<FormState>();

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
                    decoration: const BoxDecoration(
                        color: Themes.ColorApp14,
                        borderRadius: const BorderRadius.only(
                            topRight: const Radius.circular(25),
                            topLeft: Radius.circular(25))),
                    child: const Center(
                      child: Text(
                        'معلومات الحساب',
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
                    right: heightValue * 1.5,
                    child: GestureDetector(
                      onTap: () => Get.off(const SettingProfileScreen()),
                      child: const CircleAvatar(
                        backgroundColor: Themes.ColorApp5,
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FromTextProfileShared(
                          labelText: 'الاسم الاول ',
                          onChanged: (value) {
                            setState(() {
                              firstName = value;
                            });
                          },
                          isPassword: false,
                          onTapValidator: (value) {
                            if (value!.isEmpty) {
                              return 'الاسم الاول فارغ';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          Controller: FirstName,
                          hintText: 'الاسم الاول'),
                    ),
                    SizedBox(
                      height: widthValue * 1.5,
                    ),
                    Expanded(
                      child: FromTextProfileShared(
                          labelText: 'اسم العائله ',
                          onChanged: (value) {
                            setState(() {
                              lastName = value;
                            });
                          },
                          onTapValidator: (value) {
                            if (value!.isEmpty) {
                              return 'اسم العائله فارغ';
                            }
                            return null;
                          },
                          isPassword: false,
                          keyboardType: TextInputType.text,
                          Controller: LastName,
                          hintText: 'اسم العائله'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightValue * 1,
              ),
              FromTextRegisterShared(
                  labelText: 'البريد الالكتروني ',
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  readOnly: false,
                  onTapValidator: (value) {
                    if (value!.isEmpty) {
                      return 'البريد الالكتروني فارغ';
                    } else if (!(value.contains("@"))) {
                      return 'البريد الالكتروني غير صالح';
                    }
                    return null;
                  },
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                  Controller: EmailAddress,
                  hintText: 'البريد الالكتروني'),
              SizedBox(
                height: heightValue * 2.5,
              ),
              CustomButtonImage(
                  title: 'حفظ ',
                  hight: 50,
                  onTap: () => Get.off(const SettingProfileScreen()))
            ],
          ),
        ),
      )),
    );
  }
}
