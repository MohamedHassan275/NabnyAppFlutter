import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/factory_details_screen/factory_details_screen.dart';
import 'package:nabny/screens/home_main_screen/home_main_controller.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';
import 'package:nabny/screens/home_screen/home_controller.dart';
import 'package:nabny/screens/request_offer_price_screen/request_offer_price_controller.dart';
import 'package:nabny/screens/request_offer_price_screen/request_offer_price_screen.dart';
import 'package:nabny/utils/Themes.dart';
import '../../componant/CustomButtonWidget.dart';
import '../../model/home_user_model.dart';
import '../category_details_screen/category_details_screen.dart';
import '../factory_offer_price_screen/factory_offer_price_controller.dart';
import '../location_map_user_screen/google_map_locaiton_user_screen.dart';
import '../my_favorite_screen/my_favorite_controller.dart';
import '../requirements_request_offer_price_screen/requirements_request_offer_price_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController =  Get.put(HomeController());
    HomeMainController homeMainController = Get.put(HomeMainController());
    RequestOfferPriceController priceController = Get.put(RequestOfferPriceController());

    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async{
            homeController.getHomeDetailsUser();
            homeMainController.getProfileDetailsUser();
          //  priceController.getRequestOfferPrice();
           // myFavoriteController.getFavoriteUserList();
          },
          child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GetBuilder<HomeController>(
                        init: HomeController(),
                        builder: (controller){
                          if (controller.isLoading){
                            return LoadingWidget(data: '');
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: heightValue * .5,
                              ),
                              Card(
                                color: Themes.whiteColor,
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: CarouselSlider(
                                      items: controller.homeUserModel!.sliders!.map((e) => Image(
                                        image: NetworkImage('${e.image}'),
                                        height: 200,
                                        fit: BoxFit.fill,
                                      )).toList(),
                                      options: CarouselOptions(
                                        height: 200,
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
                              SizedBox(
                                height: heightValue * .5,
                              ),
                              SearchForSomeFactories(
                                  homeUserResponseModel: controller.homeUserModel,
                                  widthValue: widthValue,
                                  heightValue: heightValue,
                                  onTap: () {
                                    Get.to(const GoogleMapLocationUserScreen());
                                 //   CustomFlutterToast(Get.find<StorageService>().activeLocale.languageCode);
                                  }),
                              SizedBox(
                                height: heightValue * 1.5,
                              ),
                              LookingForFactory(widthValue: widthValue),
                              SizedBox(
                                height: heightValue * 1.5,
                              ),
                              OrderPriceRequest(
                                heightValue: heightValue,
                              ),
                              SizedBox(
                                height: heightValue * 1,
                              ),
                              CategoryListBuild(heightValue: heightValue, homeUserResponseModel: controller.homeUserModel,),
                              SizedBox(
                                height: heightValue * 1,
                              ),
                              GetBuilder<HomeController>(
                                init: HomeController(),
                                builder: (controller) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'some_factories'.tr,
                                        style: const TextStyle(
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
                                        physics: const ScrollPhysics(),
                                        itemCount: controller.homeUserModel?.companies!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5),
                                            child: FactoryItemList(companiesModel: controller.homeUserModel?.companies?[index], homeController: homeController,),
                                          );
                                        },),
                                    ],
                                  );
                                },
                              ),
                            ],
                          );
                        }),),
                ),
              )),
        )
    );
  }
}

class LookingForFactory extends StatelessWidget {
  LookingForFactory({required this.widthValue});

  double? heightValue, widthValue;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
              width: widthValue! * 2,
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
    );
  }
}

class SearchForSomeFactories extends StatelessWidget {
  SearchForSomeFactories(
      {Key? key,
      required this.homeUserResponseModel,
      required this.onTap,
      required this.heightValue,
      required this.widthValue})
      : super(key: key);

  HomeUserResponseModel? homeUserResponseModel;
  double heightValue, widthValue;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'delivery_to'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Themes.ColorApp2,
          ),
        ),
        SizedBox(
          height: heightValue * .7,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
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
                  Expanded(
                    child: Text(
                      homeUserResponseModel?.currentLocation?.address != null
                          ? '${homeUserResponseModel?.currentLocation?.address}'
                          : ' اضف عنوان',
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Themes.ColorApp8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FactoryItemList extends StatelessWidget {
  FactoryItemList({required this.companiesModel,required this.homeController});

  Companies? companiesModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;
  HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: GestureDetector(
        onTap: () => Get.to(FactoryDetailsScreen(companiesResponseModel: companiesModel!,)),
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
                      image: NetworkImage('${companiesModel?.image}'),
                      fit: BoxFit.fill,
                      height: 175,
                      width: Get.width,
                      placeholder: const AssetImage(Assets.imagesFactoryImage),
                    ),
                  ),
                  // Positioned(
                  //   top: heightValue * 1,
                  //   right: widthValue * 2,
                  //   child: GestureDetector(
                  //     onTap: (){
                  //       homeController.AddFavoriteCompany('${companiesModel!.id}');
                  //    //   homeController.getHomeDetailsUser();
                  //       print(companiesModel!.favourited);
                  //     },
                  //     child: CircleAvatar(
                  //       backgroundColor: Themes.whiteColor,
                  //       child: companiesModel!.favourited == 0 ? Image.asset(Assets.iconsFavoriteIcon) : Image.asset(Assets.imagesActiveFavorite),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: heightValue * .5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: DetailsCompany(
                    CompaniesModel: companiesModel,
                    heightValue: heightValue,
                    widthValue: widthValue),
              ),
              SizedBox(
                height: heightValue * 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCompany extends StatelessWidget {
  DetailsCompany(
      {required this.CompaniesModel,
      required this.heightValue,
      required this.widthValue});

  Companies? CompaniesModel;
  double heightValue, widthValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
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
                child: const Center(
                  child: Image(
                    image: const AssetImage(Assets.iconsFactoryNamIcon),
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
                      '${CompaniesModel?.name}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Themes.ColorApp1,
                      ),
                    ),
                    SizedBox(
                      height: heightValue * .5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   '${CompaniesModel?.rate}',
                        //   style: const TextStyle(
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 15,
                        //     color: Themes.ColorApp8,
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: widthValue * 1,
                        // ),
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
                                  '${CompaniesModel?.rate}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Themes.ColorApp13,
                                  ),
                                ),
                                SizedBox(
                                  width: widthValue * .2,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Themes.ColorApp13,
                                )
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
                '${CompaniesModel?.distance}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp8,
                ),
              ),
              SizedBox(
                width: widthValue * .5,
              ),
              Text(
                'km'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp8,
                ),
              ),

              SizedBox(
                width: widthValue * .5,
              ),
              Image.asset(
                Assets.iconsDistanceIcon,
                fit: BoxFit.contain,
                width: 35,
                height: 35,
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
  CategoryListBuild(
      {required this.heightValue, required this.homeUserResponseModel});

  HomeUserResponseModel? homeUserResponseModel;
  double heightValue;

  @override
  Widget build(BuildContext context) {
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
        SizedBox(
          height: 135,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
           // physics:  NeverScrollableScrollPhysics(),
            itemCount: homeUserResponseModel!.categories?.length,
            itemBuilder: (context, index) {
              print("category is ${homeUserResponseModel!.categories!.length}");
              print("access token is ${Get.find<StorageService>().GetToken}");
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                  child: GestureDetector(
                    onTap: (){
                    //  CustomFlutterToast('${homeUserResponseModel!.categories!.length}');
                      Get.to(CategoryDetailsScreen(categories: homeUserResponseModel!.categories![index],));
                    },
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Themes.ColorApp14,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: FadeInImage(
                                image: NetworkImage('${homeUserResponseModel!.categories![index].image}'),
                                fit: BoxFit.fill,
                                height: 50,
                                width: 50,
                                placeholder: const AssetImage(Assets.imagesFactoryImage),
                              ),
                            ),
                            SizedBox(
                              height: heightValue * .7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${homeUserResponseModel!.categories![index].name}',
                                   maxLines: 1,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    overflow: TextOverflow.fade,
                                    color: Themes.ColorApp8,
                                  ),
                                ),
                                Text(
                                  '${homeUserResponseModel!.categories![index].count}',
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
                  )
              );
            },
          ),
        ),
      ],
    );
  }
}

class WidgetCategoryItem extends StatelessWidget {
  WidgetCategoryItem(
      {Key? key,
      required this.categoriesModel,
      required this.heightValue,
      required this.onTap})
      : super(key: key);

  Categories? categoriesModel;
  void Function()? onTap;
  double? heightValue;

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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage(
                    image: NetworkImage('${categoriesModel?.image}'),
                    fit: BoxFit.fill,
                    height: 175,
                    width: Get.width,
                    placeholder: const AssetImage(Assets.imagesFactoryImage),
                  ),
                ),
                SizedBox(
                  height: heightValue! * .7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${categoriesModel?.name}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Themes.ColorApp8,
                      ),
                    ),
                    Text(
                      '${categoriesModel?.count}',
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
    );
  }
}

class OrderPriceRequest extends StatelessWidget {
  OrderPriceRequest({required this.heightValue});

  double heightValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(RequirementsRequestOfferPriceScreen(companyId: '', my_location: '')),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    width: 25,
                    height: 25,
                    child: Center(
                      child: Icon(
                        Get.find<StorageService>().activeLocale.languageCode == "en"
                            ? Icons.keyboard_arrow_right
                            : Icons.keyboard_arrow_left,
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
