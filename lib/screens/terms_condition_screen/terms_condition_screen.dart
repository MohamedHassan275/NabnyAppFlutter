
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/screens/setting_screen/setting_screen.dart';

import '../../utils/Themes.dart';
import '../home_main_screen/home_main_screen.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    String? TermsValue = 'لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه … بروشور او فلاير على سبيل المثال … او نماذج مواقع انترنت';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 119,
                    decoration: BoxDecoration(
                        color: Themes.ColorApp14,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Center(
                      child: Text(
                        'سياسه الخصوصيه ',
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
                      onTap: ()=>Get.off(HomeMainScreen(valueBack: 'setting')),
                      child: CircleAvatar(
                        backgroundColor: Themes.ColorApp5,
                        child: Icon(Icons.arrow_right_alt_rounded,color: Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: heightValue * 1,
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight:  Radius.circular(15))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('سياسه الخصوصيه ',
                        style: TextStyle(
                          color: Themes.ColorApp1,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: heightValue * 1.5,),
                      Text(TermsValue,
                        style: TextStyle(
                          color: Themes.ColorApp2,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: heightValue * 1,),
                      Text(TermsValue,
                        style: TextStyle(
                          color: Themes.ColorApp2,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: heightValue * 1,),
                      Text(TermsValue,
                        style: TextStyle(
                          color: Themes.ColorApp2,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: heightValue * 1,),
                      Text(TermsValue,
                        style: TextStyle(
                          color: Themes.ColorApp2,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
