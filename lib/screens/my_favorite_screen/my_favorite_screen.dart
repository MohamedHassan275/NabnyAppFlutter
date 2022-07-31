import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/factory_model.dart';
import 'package:nabny/model/favouriteModel.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/factory_details_screen/factory_details_screen.dart';
import 'package:nabny/screens/my_favorite_screen/my_favorite_controller.dart';

import '../../core/localization/local_controller.dart';
import '../../core/servies/storage_service.dart';
import '../../utils/Themes.dart';

class MyFavoriteScreen extends StatefulWidget {
  const MyFavoriteScreen({Key? key}) : super(key: key);

  @override
  _MyFavoriteScreenState createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen> {
  List<FavouriteResponseModel>? favouriteResponseModel =
      <FavouriteResponseModel>[];
  late FavouriteModel favouriteModel;
  Future<FavouriteModel?>? _future;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Get.put(MyFavoriteController());
  //   print(Get.find<StorageService>().GetToken);
  //   print(Get.find<MyLocalController>().language!.languageCode);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Container(
              child: GetBuilder<MyFavoriteController>(
                  init: MyFavoriteController(),
                  builder: (controller) => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.favouriteResponseModel!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: FactoryItemList(factoryModel: controller.favouriteResponseModel![index]),
                      );
                    },)))),
    ));
  }
}

class NoItemOFList extends StatelessWidget {
  NoItemOFList({Key? key}) : super(key: key);

  var widthValue = Get.width * 0.024;
  var heightValue = Get.height * 0.024;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 100,
      child: Column(
        children: [
          Image.asset(
            Assets.imagesOfferPrice,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: heightValue * 1,
          ),
          Text(
            'no_requests_offers_have_added_before'.tr,
            style: TextStyle(
              color: Themes.ColorApp8,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: heightValue * .7,
          )
        ],
      ),
    );
  }
}

class FactoryItemList extends StatelessWidget {
  FactoryItemList({required this.factoryModel});

  FavouriteResponseModel? factoryModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(FactoryDetailsScreen());
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                      image: NetworkImage("${factoryModel?.image}"),
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
                padding: const EdgeInsets.all(5.0),
                child: DetailsCompany(
                    factoryModel: factoryModel,
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
      {required this.factoryModel,
      required this.heightValue,
      required this.widthValue});

  FavouriteResponseModel? factoryModel;
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
                      '${factoryModel?.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Themes.ColorApp1,
                      ),
                    ),
                    SizedBox(
                      height: heightValue * .3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${factoryModel?.category}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Themes.ColorApp8,
                          ),
                        ),
                        SizedBox(
                          width: widthValue * 1,
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
                                  '${factoryModel?.rate}',
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
                '${factoryModel?.distance}' 'km'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp8,
                ),
              ),
              SizedBox(
                width: widthValue * 1,
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
