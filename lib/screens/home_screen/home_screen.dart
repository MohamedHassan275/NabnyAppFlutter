import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/localization/local_controller.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/category_concrete_screen/category_concrete_screen.dart';
import 'package:nabny/screens/factory_details_screen/factory_details_screen.dart';
import 'package:nabny/screens/home_screen/home_controller.dart';
import 'package:nabny/screens/request_offer_price_screen/request_offer_price_screen.dart';
import 'package:nabny/utils/Themes.dart';

import '../../model/SliderItemsModel.dart';
import '../../model/factory_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreen_State createState() => HomeScreen_State();
}

class HomeScreen_State extends State<HomeScreen> {

  HomeController homeController = Get.put(HomeController());
  MyLocalController myLocalController = Get.put(MyLocalController());

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Obx(() =>
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightValue * .5,
                    ),
                    SearchForSomeFactories(widthValue: widthValue,heightValue: heightValue,),
                    SizedBox(
                      height: heightValue * 1.5,
                    ),
                    Container(
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Themes.ColorApp2, width: 1.2)),
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
                              'Looking_factory'.tr,
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
                    Card(
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
                            items: homeController.SlidersList.map((e) =>
                                Image(
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
                              autoPlayAnimationDuration: const Duration(
                                  seconds: 1),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                            )),
                      ),
                    ),
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
                      myLocalController: myLocalController,
                    ),
                    SizedBox(
                      height: heightValue * 2,
                    ),
                    Text(
                      'some_factories'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Themes.ColorApp1,
                      ),
                    ),
                    SizedBox(
                      height: heightValue * .7,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: homeController.factoryModel.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: FactoryItemList(factoryModel: homeController
                              .factoryModel[index]),
                        );
                      },)
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class SearchForSomeFactories extends StatelessWidget {
  SearchForSomeFactories({Key? key, required this.heightValue,required this.widthValue}) : super(key: key);
  double heightValue, widthValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'delivery_to'.tr,
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
      ],
    );
  }
}

class FactoryItemList extends StatelessWidget {
  FactoryItemList({required this.factoryModel});

  FactoryModel factoryModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      child: GestureDetector(
        onTap: () => Get.to(FactoryDetailsScreen()),
        child: Container(
          width: Get.width,
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
                      image: AssetImage(factoryModel.ImageCompany!),
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
                      child: Image.asset(Assets.iconsFavoriteIcon),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: heightValue * .5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: DetailsCompany(factoryModel: factoryModel,
                    heightValue: heightValue,
                    widthValue: widthValue),
              ),
              SizedBox(height: heightValue * 1,)
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCompany extends StatelessWidget {
  DetailsCompany(
      {required this.factoryModel, required this.heightValue, required this.widthValue});

  FactoryModel factoryModel;
  double heightValue, widthValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    Text(
                      '${factoryModel.NameCompany}',
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
                        Text(
                          '${factoryModel.RateText}',
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
                                Text(
                                  '${factoryModel.RateNumber}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Themes.ColorApp13,
                                  ),
                                ),
                                SizedBox(width: widthValue * .2,),
                                Icon(Icons.star, color: Themes.ColorApp13,)
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
              Text(
                '${factoryModel.DistanceCompany}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp8,
                ),
              ),
              SizedBox(width: widthValue * 1,),
              Image.asset(Assets.iconsDistanceIcon, fit: BoxFit.contain,
                width: 35,
                height: 35,)
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
              crossAxisAlignment: CrossAxisAlignment.start,
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

class CategoryListBuild extends StatelessWidget {
  CategoryListBuild({required this.heightValue});

  double heightValue;

  @override
  Widget build(BuildContext context) {
    MyLocalController myLocalController = Get.put(MyLocalController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'all_categories'.tr,
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
            WidgetCategoryItem(name: 'concrete'.tr, number: '200', image: Assets.imagesImageCategory1,heightValue: heightValue, onTap: ()=> Get.to(const CategoryConcreteScreen()), ),
            const SizedBox(
              width: 5,
            ),
            WidgetCategoryItem(name: 'bricks'.tr, number: '250', image: Assets.imagesImageCategory2,heightValue: heightValue, onTap: ()=> Get.to('')),
            const SizedBox(
              width: 5,
            ),
            WidgetCategoryItem(name: 'block'.tr, number: '350', image: Assets.imagesImageCategory3,heightValue: heightValue, onTap: ()=> Get.to('')),
          ],
        ),
      ],
    );
  }
}

class WidgetCategoryItem extends StatelessWidget {
  WidgetCategoryItem(
      {Key? key, required this.name, required this.number, required this.image, required this.heightValue, required this.onTap})
      : super(key: key);

  double? heightValue;
  String? name, number,image;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
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
                  image!,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: heightValue! * .7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Themes.ColorApp8,
                      ),
                    ),
                    Text(
                      number!,
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
    );
  }
}

class OrderPriceRequest extends StatelessWidget {
  OrderPriceRequest(
      {required this.heightValue, required this.myLocalController});

  double heightValue;
  MyLocalController myLocalController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(RequestOfferPriceScreen()),
      child: Container(
        width: Get.width,
        height: 100,
        decoration: BoxDecoration(
          color: Themes.ColorApp14,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Themes.ColorApp1, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.imagesOrderPriceImage,
                    width: 35,
                    height: 35,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: heightValue * .3,
                  ),
                  Text(
                    'request_offer_price'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Themes.ColorApp8,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                color: Themes.whiteColor,
                elevation: 2.0,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    width: 25,
                    height: 25,
                    child: Center(
                      child: Icon(
                        myLocalController.language!.languageCode == "ar" ? Icons
                            .subdirectory_arrow_left : Icons
                            .subdirectory_arrow_right,
                        size: 25,
                        color: Themes.ColorApp1,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
