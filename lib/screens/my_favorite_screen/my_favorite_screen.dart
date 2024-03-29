import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/factory_model.dart';
import 'package:nabny/model/favouriteModel.dart';
import 'package:nabny/repositries/servies_api/MyServiceApi.dart';
import 'package:nabny/screens/factory_details_screen/factory_details_screen.dart';
import 'package:nabny/screens/my_favorite_screen/factory_details_favorite_screen.dart';
import 'package:nabny/screens/my_favorite_screen/my_favorite_controller.dart';

import '../../core/localization/local_controller.dart';
import '../../core/servies/storage_service.dart';
import '../../utils/Themes.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyFavoriteController myFavoriteController = Get.put(MyFavoriteController());
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async{
            myFavoriteController.getFavoriteUserList();
          },
          child: SafeArea(
              child: GetBuilder<MyFavoriteController>(
                    init: MyFavoriteController(),
                    builder: (controller){
                      if(controller.Loading){
                        return LoadingWidget(data: '');
                      }
                      if(controller.favouriteResponseModel!.isNotEmpty){
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.favouriteResponseModel!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: FactoryItemList(factoryModel: controller.favouriteResponseModel![index], myFavoriteController: myFavoriteController,),
                            );
                          },);
                      }else {
                        return NoItemOFList();
                      }
                    }
                )),
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
            'no_company_have_favorite'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Themes.ColorApp8,
              fontSize: 19,
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
  FactoryItemList({required this.factoryModel,required this.myFavoriteController});

  FavouriteResponseModel? factoryModel;
  MyFavoriteController myFavoriteController;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(FactoryDetailsFavoriteScreen(favouriteResponseModel: factoryModel!,));
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
                    child: GestureDetector(
                      onTap: (){
                        myFavoriteController.RemoveFavoriteCompany('${factoryModel?.id}');
                        myFavoriteController.getFavoriteUserList();
                      },
                      child: CircleAvatar(
                        backgroundColor: Themes.whiteColor,
                        child: Image.asset(Assets.imagesActiveFavorite),
                      ),
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
                        fontSize: 15,
                        color: Themes.ColorApp1,
                      ),
                    ),
                    SizedBox(
                      height: heightValue * .5,
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
                '${factoryModel?.distance}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Themes.ColorApp8,
                ),
              ),
              SizedBox(
                width: widthValue * .3,
              ),
              Text(
                'km'.tr,
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
