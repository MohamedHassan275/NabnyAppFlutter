import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';

import '../../utils/Themes.dart';

class MyFavoriteScreen extends StatefulWidget {
  const MyFavoriteScreen({Key? key}) : super(key: key);

  @override
  _MyFavoriteScreenState createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
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
                  'المفضلة ',
                  style: TextStyle(
                    color: Themes.ColorApp15,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightValue * 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  FactoryItemList(heightValue: heightValue, widthValue: widthValue),
                  SizedBox(height: heightValue * 1,),
                  FactoryItemList(heightValue: heightValue, widthValue: widthValue),
                  SizedBox(height: heightValue * 1,),
                  FactoryItemList(heightValue: heightValue, widthValue: widthValue),
                  SizedBox(height: heightValue * 1,),
                  FactoryItemList(heightValue: heightValue, widthValue: widthValue),
                  SizedBox(height: heightValue * 1,),
                  FactoryItemList(heightValue: heightValue, widthValue: widthValue),
                  SizedBox(height: heightValue * 1,),
                ],
              ),
            ),
          ],
        ),
      )),
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
      height: 250,
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
              Positioned(
                top: heightValue * 1,
                right: widthValue * 2,
                child: CircleAvatar(
                  backgroundColor: Themes.whiteColor,
                  child: Image.asset(Assets.imagesActiveFavorite),
                ),
              )
            ],
          ),
          SizedBox(
            height: heightValue * .5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Themes.ColorApp14,
                        borderRadius: BorderRadius.circular(15),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(width: widthValue * 1,),
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
                      ),
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
                        color: Themes.ColorApp8,
                      ),
                    ),
                    SizedBox(width: widthValue * 1,),
                    Image.asset(Assets.iconsDistanceIcon,fit: BoxFit.contain,width: 35,height: 35,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}