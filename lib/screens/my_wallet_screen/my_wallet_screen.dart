
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';

import '../../utils/Themes.dart';
import '../home_main_screen/home_main_screen.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  _MyWalletScreenState createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    var widthValue = Get.width * 0.024;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppbarDetailsOrder(widthValue, heightValue),
                  SizedBox(height: heightValue * 1.2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: Get.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.imagesBackgroundWalletMoney),
                              fit: BoxFit.fill
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'الرصيد المتوفر',
                                style: TextStyle(
                                  color: Themes.whiteColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: heightValue * .5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '70',
                                    style: TextStyle(
                                      color: Themes.whiteColor,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: widthValue * .5,),
                                  Text(
                                    'SR',
                                    style: TextStyle(
                                      color: Themes.whiteColor,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: heightValue * .7,),
                        Text(
                          'التعاملات الاخيره',
                          style: TextStyle(
                            color: Themes.ColorApp8,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: heightValue * .7,),
                        AddressDetailsOrder(balanceText: 'رصيد مرتجع', myBalance: '+ 100 ريال ', dateBalance: '12/6/2022', color: Themes.ColorApp17,),
                        SizedBox(height: heightValue * .5,),
                        AddressDetailsOrder(balanceText: 'شركه بن لادن', myBalance: '- 250 ريال ', dateBalance: '12/6/2022', color: Themes.ColorApp9,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppbarDetailsOrder extends StatelessWidget {
  AppbarDetailsOrder(this.widthValue, this.heightValue);

  double heightValue, widthValue;

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
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          child: Center(
            child: Text(
              'المحفظه',
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

class AddressDetailsOrder extends StatelessWidget {
  AddressDetailsOrder({required this.balanceText,required this.dateBalance,required this.myBalance,required this.color});

  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;
  String balanceText,dateBalance,myBalance;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: Get.width,
          height: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp14,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(Assets.imagesWalletMyBalance),
                        fit: BoxFit.contain,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          balanceText,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Themes.ColorApp1,
                          ),
                        ),
                        SizedBox(
                          height: heightValue * .3,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                           dateBalance,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Themes.ColorApp11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    myBalance,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}