import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/componant/factory_card.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/favouriteModel.dart';
import 'package:nabny/screens/my_favorite_screen/factory_details_favorite_screen.dart';
import 'package:nabny/screens/my_favorite_screen/my_favorite_controller.dart';

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
                      } else {
                        return NoItemOFList();
                      }
                    },
                  ),
        ),
    );
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
  FactoryItemList({required this.factoryModel, required this.myFavoriteController});

  FavouriteResponseModel? factoryModel;
  MyFavoriteController myFavoriteController;

  @override
  Widget build(BuildContext context) {
    return FactoryCard(
      name: '${factoryModel?.name ?? ''}',
      rate: '${factoryModel?.rate ?? ''}',
      distance: '${factoryModel?.distance ?? ''}',
      imageUrl: '${factoryModel?.image ?? ''}',
      onTap: () => Get.to(
        FactoryDetailsFavoriteScreen(favouriteResponseModel: factoryModel!),
      ),
      trailing: GestureDetector(
        onTap: () {
          myFavoriteController.RemoveFavoriteCompany('${factoryModel?.id}');
          myFavoriteController.getFavoriteUserList();
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 16,
          child: Image.asset(
            Assets.imagesActiveFavorite,
            width: 18,
            height: 18,
          ),
        ),
      ),
    );
  }
}
