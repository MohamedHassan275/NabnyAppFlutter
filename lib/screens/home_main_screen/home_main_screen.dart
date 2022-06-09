import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/home_main_screen/home_main_controller.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';
import 'package:nabny/screens/my_address_screen/my_arddress_screen.dart';
import 'package:nabny/screens/my_wallet_screen/my_wallet_screen.dart';
import 'package:nabny/screens/setting_profile_screen/setting_profile_screen.dart';
import 'package:nabny/utils/Themes.dart';
import 'package:provider/provider.dart';

import '../change_password_profile/change_password_profile.dart';

class HomeMainScreen extends StatefulWidget {
  HomeMainScreen({required this.valueBack});

  String? valueBack;

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    HomeMainController homeMainController =
        Provider.of<HomeMainController>(context);
    return Scaffold(
      backgroundColor: Themes.whiteColor,
      appBar: AppBar(
        backgroundColor: Themes.ColorApp1,
        toolbarHeight: 75,
        title: Container(
          height: 75,
          child: Row(
            children: [
              UserProfileWithNotification(
                  heightValue: heightValue, widthValue: widthValue),
            ],
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
          actions: [
            InkWell(
              onTap: (){
               // MyNavigator.NavigatorToPage(context, SearchSessionUserPage());
              },
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: CircleAvatar(
                  backgroundColor: Themes.whiteColor,
                  child: Center(
                      child: const Icon(
                        Icons.notifications_none,
                        color: Themes.ColorApp1,
                      )),
                ),
              )
            )
          ]
      ),
      body: homeMainController.PageList[homeMainController.indexPage!],
      bottomNavigationBar: BottomNavigationBar(
        items: homeMainController.navigationItem,
        selectedItemColor: Themes.ColorApp1,
        unselectedItemColor: Themes.ColorApp2,
        type: BottomNavigationBarType.fixed,
        onTap: (int? index) {
          setState(() {
            homeMainController.indexPage = index;
          });
          homeMainController.PageList[homeMainController.indexPage!];
        },
        currentIndex: homeMainController.indexPage!,
      ),
      drawer: Drawer(
        backgroundColor: Themes.whiteColor,
        child: ListView(
          children: [
            new Container(
              child: new DrawerHeader(
                  child: new Container(
                child: Wrap(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Themes.ColorApp16,
                          radius: 45,
                          child: ClipOval(
                            child: Image.asset(
                              Assets.imagesFactoryImage,
                              fit: BoxFit.cover,
                              width: 82,
                              height: 82,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Mohamed Hassan',
                          style:
                              TextStyle(fontSize: 13, color: Themes.ColorApp8),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'رقم الحساب ',
                              style: TextStyle(
                                  fontSize: 13, color: Themes.ColorApp8),
                            ),
                            SizedBox(
                              width: widthValue * .5,
                            ),
                            Text(
                              '#34567898',
                              style: TextStyle(
                                  fontSize: 13, color: Themes.ColorApp8),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
              color: Themes.whiteColor,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Themes.whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(const SettingProfileScreen()),
                      child: Container(
                        height: 60,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Themes.ColorApp14,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  Assets.iconsProfileMenuIcon,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: widthValue * 1,
                                ),
                                Text(
                                  'حسابي',
                                  style: TextStyle(
                                    color: Themes.ColorApp15,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightValue * .7,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(const MyWalletScreen()),
                      child: Container(
                        height: 60,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Themes.ColorApp14,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  Assets.iconsWalletMenuIcon,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: widthValue * 1,
                                ),
                                Text(
                                  'المحفظه',
                                  style: TextStyle(
                                    color: Themes.ColorApp15,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightValue * .7,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(const MyAddressScreen()),
                      child: Container(
                        height: 60,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Themes.ColorApp14,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  Assets.iconsMyLocationMenuIcon,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: widthValue * 1,
                                ),
                                Text(
                                  'عناويني',
                                  style: TextStyle(
                                    color: Themes.ColorApp15,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightValue * 2.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(LoginScreen());
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Themes.whiteColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Themes.ColorApp9, width: 1),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.power_settings_new,
                                  color: Themes.ColorApp9,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightValue * .7,
                            ),
                            Text(
                              'تسجيل خروج',
                              style: TextStyle(
                                color: Themes.ColorApp9,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
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
      Image.asset(
        Assets.imagesProfileImage,
        width: 45,
        height: 45,
        fit: BoxFit.contain,
      ),
      SizedBox(
        width: 15,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اهلا بك',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Text(
                'محمد حسن',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
            ],
          )
        ],
      )
    ]);
  }
}
