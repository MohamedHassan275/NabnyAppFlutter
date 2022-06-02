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
                UserProfileWithNotification(
                    heightValue: heightValue, widthValue: widthValue),
                SizedBox(
                  height: heightValue * 1.2,
                ),
                const Text(
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
                        const Text(
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
                        const Text(
                          'ابحث عن مصنع !! ',
                          style: const TextStyle(
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
                SliderFactoryImage(SlidersList: SlidersList),
                SizedBox(
                  height: heightValue * 1.5,
                ),
                CategoryListBuild(
                  heightValue: heightValue,
                ),
                SizedBox(
                  height: heightValue * 2,
                ),
                OrderPriceRequest(
                  heightValue: heightValue,
                ),
                SizedBox(
                  height: heightValue * 2,
                ),
                const Text(
                  'بعض المصانع',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Themes.ColorApp1,
                  ),
                ),
                SizedBox(
                  height: heightValue * .7,
                ),
                FactoryItemList(widthValue: widthValue,heightValue: heightValue,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FactoryItemList extends StatelessWidget {
  FactoryItemList({required this.heightValue, required this.widthValue});

  double widthValue, heightValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 175,
      decoration: BoxDecoration(
        color: Themes.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  image: AssetImage(Assets.imagesFactoryImage),
                  fit: BoxFit.fill,
                  height: 175,
                  width: Get.width,
                  placeholder: AssetImage(Assets.imagesFactoryImage),
                ),
              ),
              CircleAvatar(
                backgroundColor: Themes.whiteColor,
                child: Image.asset(Assets.iconsFavoriteIcon),
              )
            ],
          ),
          SizedBox(
            height: heightValue * .5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp11,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Themes.ColorApp1, width: 1.0),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(Assets.iconsFactoryNamIcon),
                        fit: BoxFit.contain,
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        'شركه بن لادن',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Themes.ColorApp1,
                        ),
                      ),
                      SizedBox(height: heightValue * .3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'جيد جدا',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Themes.ColorApp8,
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Themes.ColorApp12
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '4.7',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Themes.ColorApp13,
                                    ),
                                  ),
                                  SizedBox(width: widthValue * .2,),
                                  Icon(Icons.star,color: Themes.ColorApp13,)
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '45.7 km',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Themes.ColorApp13,
                    ),
                  ),
                  Image.asset(Assets.iconsDistanceIcon,fit: BoxFit.contain,width: 35,height: 35,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class UserProfileWithNotification extends StatelessWidget {
  UserProfileWithNotification(
      {required this.heightValue, required this.widthValue});

  double widthValue, heightValue;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                const Text(
                  'اهلا بك',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Themes.ColorApp1,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: heightValue * .2,
                ),
                const Text(
                  'محمد ابراهيم…',
                  style: const TextStyle(
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
              border: Border.all(color: Themes.ColorApp10, width: 1.5)),
          child: const Center(
              child: const Icon(
            Icons.notifications_none,
            color: Themes.ColorApp10,
          )),
        )
      ],
    );
  }
}

class SliderFactoryImage extends StatelessWidget {
  SliderFactoryImage({required List<SliderItemsModel> SlidersList});

  List<SliderItemsModel> SlidersList = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Themes.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: CarouselSlider(
            items: SlidersList.map((e) => Image(
                  image: AssetImage('${e.ImageSlider}'),
                  height: 165,
                  fit: BoxFit.fill,
                )).toList(),
            options: CarouselOptions(
              height: 275,
              aspectRatio: 2.0,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            )),
      ),
    );
  }
}

class CategoryListBuild extends StatelessWidget {
  CategoryListBuild({required this.heightValue});

  double heightValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'كل الفئات ',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Themes.ColorApp1,
          ),
        ),
        SizedBox(
          height: heightValue * 1,
        ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.imagesImageCategory1,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'خرسانه ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Themes.ColorApp8,
                            ),
                          ),
                          const Text(
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
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Themes.ColorApp14,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.imagesImageCategory2,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'طوب ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Themes.ColorApp8,
                            ),
                          ),
                          const Text(
                            '210 ',
                            style: const TextStyle(
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
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Themes.ColorApp14,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.imagesImageCategory3,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'بلوك ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Themes.ColorApp8,
                            ),
                          ),
                          const Text(
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
        ),
      ],
    );
  }
}

class OrderPriceRequest extends StatelessWidget {
  OrderPriceRequest({required this.heightValue});

  double heightValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 45,
      decoration: BoxDecoration(
        color: Themes.ColorApp11,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Themes.ColorApp1, width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                Assets.imagesOrderPriceImage,
                width: 35,
                height: 35,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: heightValue * 1.2,
              ),
              const Text(
                'طلب عروض اسعار ',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Themes.ColorApp8,
                ),
              ),
            ],
          ),
          Card(
            color: Themes.whiteColor,
            elevation: 2.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                width: 45,
                height: 45,
                child: const Center(
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 25,
                    color: Themes.ColorApp1,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
