import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/category_company_details_screen/category_company_details_screen.dart';
import 'package:nabny/screens/category_details_screen/category_details_controller.dart';

import '../../core/constant/Themes.dart';
import '../../core/servies/storage_service.dart';
import '../../model/companiesModel.dart';
import '../../model/home_user_model.dart';
import '../home_main_screen/home_main_screen.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen({Key? key,required this.categories}) : super(key: key);
  Categories? categories;
  @override
  Widget build(BuildContext context) {
    CategoryDetailsController categoryDetailsController = Get.put(CategoryDetailsController(categories!.id.toString()));

    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          categoryDetailsController.getCategoryDetails(categories!.id.toString());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<CategoryDetailsController>(
              init: CategoryDetailsController(categories!.id.toString()),
              builder: (controller) {
                if (controller.Loading){
                  return LoadingWidget(data: '');
                }
                return Column(
                  children: [
                    AppbarDetailsOrder(categories!,widthValue, heightValue),
                    SizedBox(
                      height: heightValue * 1,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: controller.companiesResponseModel!.isNotEmpty ? ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.companiesResponseModel!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: FactoryItemList(companiesResponseModel: controller.companiesResponseModel![index], categories: categories,),
                            );
                          },) : NoItemOFList()
                    ),
                  ],
                );
              },),
          ),
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
            'no_companies_here'.tr,
            textAlign: TextAlign.center,
            maxLines: 2,
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

class AppbarDetailsOrder extends StatelessWidget {
  AppbarDetailsOrder(this.categories,this.widthValue,this.heightValue);
  Categories categories;
  double heightValue,widthValue;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              '${categories.name}'.tr,
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
            onTap: () => Get.off(HomeMainScreen(valueBack: '')),
            child: CircleAvatar(
              backgroundColor: Themes.ColorApp5,
              child: Icon(
                Get.find<StorageService>().activeLocale.languageCode == "en" ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FactoryItemList extends StatelessWidget {
  FactoryItemList({required this.companiesResponseModel,required this.categories});
  Categories? categories;
  CompaniesResponseModel companiesResponseModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          Get.to(CategoryCompanyDetailsScreen(companiesResponseModel: companiesResponseModel,categories: categories,));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
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
                      image: NetworkImage(companiesResponseModel.image!),
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
                child: DetailsCompany(companiesResponseModel: companiesResponseModel, heightValue: heightValue, widthValue: widthValue),
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
  DetailsCompany({required this.companiesResponseModel,required this.heightValue,required this.widthValue});

  CompaniesResponseModel companiesResponseModel;
  double heightValue,widthValue;
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
                      '${companiesResponseModel.name}',
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
                        // Text(
                        //   '${CompaniesResponseModel.RateText}',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 15,
                        //     color: Themes.ColorApp8,
                        //   ),
                        // ),
                        // SizedBox(width: widthValue * 1,),
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
                                  '${companiesResponseModel.rate}',
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
              Text(
                '${companiesResponseModel.distance}',
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
    );
  }
}
