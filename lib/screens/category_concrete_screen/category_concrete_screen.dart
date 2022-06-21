
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/screens/category_concrete_screen/category_concrete_contoller.dart';

import '../../generated/assets.dart';
import '../../model/factory_model.dart';
import '../../utils/Themes.dart';
import '../factory_details_screen/factory_details_screen.dart';
import '../home_main_screen/home_main_screen.dart';

class CategoryConcreteScreen extends StatefulWidget {
  const CategoryConcreteScreen({Key? key}) : super(key: key);

  @override
  _CategoryConcreteScreenState createState() => _CategoryConcreteScreenState();
}

class _CategoryConcreteScreenState extends State<CategoryConcreteScreen> {

  CategoryConcreteContoller categoryConcreteContoller = Get.put(CategoryConcreteContoller());

  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarDetailsOrder(widthValue, heightValue),
              SizedBox(
                height: heightValue * 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: categoryConcreteContoller.factoryModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: FactoryItemList(factoryModel: categoryConcreteContoller.factoryModel[index]),
                    );
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppbarDetailsOrder extends StatelessWidget {
  AppbarDetailsOrder(this.widthValue,this.heightValue);

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
              'خرسانة',
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
                Icons.arrow_right_alt_rounded,
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
  FactoryItemList({required this.factoryModel});

  FactoryModel factoryModel;
  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(FactoryDetailsScreen());
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
                child: DetailsCompany(factoryModel: factoryModel, heightValue: heightValue, widthValue: widthValue),
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
  DetailsCompany({required this.factoryModel,required this.heightValue,required this.widthValue});

  FactoryModel factoryModel;
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
                '${factoryModel.DistanceCompany}',
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
