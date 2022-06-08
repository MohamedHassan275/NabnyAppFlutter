import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/screens/home_main_screen/home_main_screen.dart';

import '../../generated/assets.dart';
import '../../utils/Themes.dart';

class MyAddressRequestOfferScreen extends StatefulWidget {
  const MyAddressRequestOfferScreen({Key? key}) : super(key: key);

  @override
  _MyAddressRequestOfferScreenState createState() =>
      _MyAddressRequestOfferScreenState();
}

class _MyAddressRequestOfferScreenState
    extends State<MyAddressRequestOfferScreen> {
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
            child: Stack(
              children: [
                AppbarDetailsOrder(widthValue, heightValue),
                SizedBox(
                  height: heightValue * 1.2,
                ),
                Positioned(
                  top: heightValue * 8,
                  right: widthValue * 1,
                  left: widthValue * 1,
                  child: AddressDetailsOrder(),
                ),
                SizedBox(
                  height: heightValue * 5,
                ),
                Positioned(
                    bottom: heightValue * .1, child: const BottomSheetItem())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressDetailsOrder extends StatelessWidget {
  AddressDetailsOrder();

  var heightValue = Get.height * 0.024;
  var widthValue = Get.width * 0.024;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: Get.width,
          height: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp14,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(Assets.iconsDistanceIcon),
                        fit: BoxFit.contain,
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'جده حي الوزيريه قاعه امنيتي',
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
                            '2483 حي ، 7251 مدائن الفهد ، جده 22347 السعوديه',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Themes.ColorApp1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
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
              'تنفيذ الطلب',
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

class BottomSheetItem extends StatefulWidget {
  const BottomSheetItem({Key? key}) : super(key: key);

  @override
  _BottomSheetItemState createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  @override
  Widget build(BuildContext context) {
    var heightValue = Get.height * 0.024;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: Themes.whiteColor),
      width: Get.width,
      height: 325,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                width: Get.width,
                height: 5,
                decoration: BoxDecoration(
                    color: Themes.ColorApp11,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: heightValue * 2,
            ),
           Container(
             width: Get.width,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'ملخص الدفع',
                   style: TextStyle(
                     color: Themes.ColorApp8,
                     fontSize: 16,
                     fontWeight: FontWeight.w400,
                   ),
                 ),
                 SizedBox(
                   height: heightValue * .7,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       'قيمه الطلب',
                       style: TextStyle(
                         color: Themes.ColorApp8,
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                       ),
                     ),
                     Text(
                       '5000 ريال ',
                       style: TextStyle(
                         color: Themes.ColorApp1,
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                       ),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: heightValue * .7,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       'القيمه المضافه',
                       style: TextStyle(
                         color: Themes.ColorApp8,
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                       ),
                     ),
                     Text(
                       '200 ريال ',
                       style: TextStyle(
                         color: Themes.ColorApp1,
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                       ),
                     ),
                   ],
                 ),
                 SizedBox(height: heightValue * .7,),
                 Container(
                   width: Get.width,
                   height: 50,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(25),
                   ),
                   child: Center(
                     child:  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           'الاجمالي',
                           style: TextStyle(
                             color: Themes.ColorApp8,
                             fontSize: 18,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                         Text(
                           '5200 ريال ',
                           style: TextStyle(
                             color: Themes.ColorApp1,
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(height: heightValue * 1,),
                 CustomButtonImage(
                     title: 'متابعة',
                     hight: 50,
                     onTap: (){
                       setState(() {
                         //  Get.off(HomeMainScreen(valueBack: ''));
                       });
                     }),
                 SizedBox(height: heightValue * 1,),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
