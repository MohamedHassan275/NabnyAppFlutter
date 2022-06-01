import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/utils/Themes.dart';

import '../../model/SliderItemsModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreen_State createState() => HomeScreen_State();
}

class HomeScreen_State extends State<HomeScreen> {
  List<SliderItemsModel> SlidersList = [
    SliderItemsModel(Assets.imagesSliderImage),
    SliderItemsModel(Assets.imagesSliderImage),
    SliderItemsModel(Assets.imagesSliderImage),
    SliderItemsModel(Assets.imagesSliderImage),
    SliderItemsModel(Assets.imagesSliderImage),
  ];

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightValue * .5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesProfileImage,
                          height: 50,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: widthValue * 1,
                        ),
                        Column(
                          children: [
                            Text(
                              'اهلا بك',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Themes.ColorApp1,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: heightValue * .2,
                            ),
                            Text(
                              'محمد ابراهيم…',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Themes.ColorApp8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          border:
                              Border.all(color: Themes.ColorApp10, width: 1.5)),
                      child: Center(
                          child: Icon(
                        Icons.notifications_none,
                        color: Themes.ColorApp10,
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: heightValue * 1.2,
                ),
                Text(
                  'التوصيل الي ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Themes.ColorApp2,
                  ),
                ),
                SizedBox(
                  height: heightValue * .7,
                ),
                Container(
                  width: Get.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Themes.ColorApp2, width: 1.2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.iconsLocationIcon,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: widthValue * 2,
                        ),
                        Text(
                          'جده 22347 السعوديه ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Themes.ColorApp8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightValue * 1.5,
                ),
                Container(
                  width: Get.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Themes.ColorApp2, width: 1.2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.iconsSearchIcon,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: widthValue * 2,
                        ),
                        Text(
                          'ابحث عن مصنع !! ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Themes.ColorApp8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightValue * 1.5,
                ),
                Card(
                  color: Themes.ColorApp2,
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CarouselSlider(
                        items: SlidersList
                            .map((e) => Image(
                                  image: AssetImage('${e.ImageSlider}'),
                                  height: 165,
                                  fit: BoxFit.fill,
                                ))
                            .toList(),
                        options: CarouselOptions(
                          height: 275,
                          aspectRatio: 2.0,
                          viewportFraction: 1.0,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        )),
                  ),
                ),
                SizedBox(height: heightValue * 1.5,),
                Text(
                  'كل الفئات ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Themes.ColorApp1,
                  ),
                ),
                SizedBox(height: heightValue * 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Themes.ColorApp14,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.imagesImageCategory1,fit: BoxFit.contain,),
                              SizedBox(height: heightValue * .7,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'خرسانه ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Themes.ColorApp8,
                                    ),
                                  ),
                                  Text(
                                    '200 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Themes.ColorApp8,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Themes.ColorApp14,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.imagesImageCategory2,fit: BoxFit.contain,),
                              SizedBox(height: heightValue * .7,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'طوب ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Themes.ColorApp8,
                                    ),
                                  ),
                                  Text(
                                    '210 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Themes.ColorApp8,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Themes.ColorApp14,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.imagesImageCategory3,fit: BoxFit.contain,),
                              SizedBox(height: heightValue * .7,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'بلوك ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Themes.ColorApp8,
                                    ),
                                  ),
                                  Text(
                                    '205',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Themes.ColorApp8,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
