import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/requirements_request_offer_price_screen/requirements_request_offer_price_screen.dart';

import '../../generated/assets.dart';
import '../../utils/Themes.dart';

class FactoryDetailsScreen extends StatefulWidget {
  const FactoryDetailsScreen({Key? key}) : super(key: key);

  @override
  _FactoryDetailsScreenState createState() => _FactoryDetailsScreenState();
}

class _FactoryDetailsScreenState extends State<FactoryDetailsScreen> {

  MyLocalController myLocalController = Get.put(MyLocalController());

  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesBackgroundFactoryDetails),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35), topLeft: Radius.circular(35))),
            child: Stack(
              children: [
                ImageAndFavoriteFactory(heightValue: heightValue),
                Positioned(
                    top: heightValue * 13,
                    right: widthValue * 2,
                    left: widthValue * 2,
                    child: FactoryDetails(
                      heightValue: heightValue,
                      widthValue: widthValue,
                    )),
                SizedBox(height: heightValue * 1.5,),
                Positioned(
                    top: heightValue * 22,
                    child: FactoryDetails2(
                      heightValue: heightValue,
                      widthValue: widthValue,
                    )),
                Positioned(
                    bottom: heightValue * 3,
                    child: CustomButtonImage(title: 'request_price2'.tr, hight: 50, onTap: () {
                      Get.to(RequirementsRequestOfferPriceScreen());
                    },)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageAndFavoriteFactory extends StatelessWidget {
  ImageAndFavoriteFactory({required this.heightValue});

  double heightValue;
  double height = Get.height * 0.024 * 2;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyLocalController>(builder: (myLocalController) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ()=> Get.to(HomeMainScreen(valueBack: '')),
            child: CirclerIcons(
                width: 35,
                height: 35,
                widget: Icon(
                  myLocalController.language!.languageCode == "en" ? Icons.language : Icons.subdirectory_arrow_left,),
                color: Themes.whiteColor),
          ),
          GestureDetector(
            onTap: () {},
            child: CirclerIcons(
                width: 35,
                height: 35,
                widget: Image.asset(Assets.iconsFavoriteIcon),
                color: Themes.whiteColor),
          )
        ],
      ),
    ));
  }
}

class FactoryDetails extends StatelessWidget {
  FactoryDetails({required this.heightValue, required this.widthValue});

  double heightValue, widthValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Container(
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Themes.ColorApp14,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Image.asset(
                            Assets.iconsFactoryNamIcon,
                            width: 35,
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widthValue * .7,
                      ),
                      Text(
                        'شركه بن لادن',
                        style: TextStyle(
                          fontSize: 12,
                          color: Themes.ColorApp1,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'جيد جدا',
                        style: TextStyle(
                          fontSize: 12,
                          color: Themes.ColorApp1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: widthValue * .3,
                      ),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Themes.ColorApp12),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.7',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Themes.ColorApp13,
                                ),
                              ),
                              SizedBox(
                                width: widthValue * .2,
                              ),
                              Icon(
                                Icons.star,
                                color: Themes.ColorApp13,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: heightValue * .7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StyleOrderWidget(
                    title: 'قواعد',
                  ),
                  SizedBox(width: widthValue * .7,),
                  StyleOrderWidget(
                    title: 'اعمده',
                  ),
                  SizedBox(width: widthValue * .7,),
                  StyleOrderWidget(
                    title: 'بلاطات',
                  ),
                ],
              ),
              SizedBox(
                height: heightValue * 1.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FactoryDetails2 extends StatelessWidget {
   FactoryDetails2({required this.heightValue, required this.widthValue});

  double heightValue, widthValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'عن الشركه',
              style: TextStyle(
                fontSize: 16,
                color: Themes.ColorApp8,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: heightValue * .5,),
            Text(
              'وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه … بروشور او فلاير على سبيل المثال … او نماذج مواقع انترنت …',
              style: TextStyle(
                fontSize: 16,
                color: Themes.ColorApp8,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class StyleOrderWidget extends StatelessWidget {
  StyleOrderWidget({required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 35,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Themes.ColorApp14,),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Themes.ColorApp1,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class CirclerIcons extends StatelessWidget {
  CirclerIcons(
      {required this.width,
      required this.height,
      required this.widget,
      required this.color});

  double width, height;
  Color color;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: CircleAvatar(
        backgroundColor: color,
        child: Center(child: widget),
      ),
    );
  }
}
