import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/componant/factory_card.dart';
import 'package:nabny/componant/nabny_app_bar.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/category_company_details_screen/category_company_details_screen.dart';
import 'package:nabny/screens/category_details_screen/category_details_controller.dart';

import '../../core/constant/Themes.dart';
import '../../model/companiesModel.dart';
import '../../model/home_user_model.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen({Key? key,required this.categories}) : super(key: key);
  Categories? categories;
  @override
  Widget build(BuildContext context) {
    CategoryDetailsController categoryDetailsController = Get.put(CategoryDetailsController(categories!.id.toString()));

    final heightValue = Get.height * 0.024;
    return Scaffold(
      backgroundColor: Themes.ColorApp7,
      appBar: NabnyAppBar(title: '${categories!.name}'),
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


class FactoryItemList extends StatelessWidget {
  FactoryItemList({required this.companiesResponseModel, required this.categories});
  Categories? categories;
  CompaniesResponseModel companiesResponseModel;

  @override
  Widget build(BuildContext context) {
    return FactoryCard(
      name: '${companiesResponseModel.name ?? ''}',
      rate: '${companiesResponseModel.rate ?? ''}',
      distance: '${companiesResponseModel.distance ?? ''}',
      imageUrl: companiesResponseModel.image ?? '',
      onTap: () => Get.to(
        CategoryCompanyDetailsScreen(
          companiesResponseModel: companiesResponseModel,
          categories: categories,
        ),
      ),
    );
  }
}
