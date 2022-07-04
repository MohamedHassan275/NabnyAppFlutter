import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/constant/constant.dart';
import 'package:nabny/core/widget/custom_circler_progress_indicator_widget.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/model/profile_user_model.dart';
import 'package:nabny/screens/home_main_screen/home_main_controller.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';
import 'package:nabny/screens/my_address_screen/my_arddress_screen.dart';
import 'package:nabny/screens/my_wallet_screen/my_wallet_screen.dart';
import 'package:nabny/screens/setting_profile_screen/setting_profile_screen.dart';
import 'package:nabny/utils/Themes.dart';
import 'package:provider/provider.dart';

import '../../core/servies/storage_service.dart';
import '../change_password_profile/change_password_profile.dart';

class HomeMainScreen extends StatefulWidget {
  HomeMainScreen({required this.valueBack});

  String? valueBack;

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut(() => HomeMainController());
  }
  @override
  Widget build(BuildContext context) {
    var widthValue = Get.width * 0.024;
    var heightValue = Get.height * 0.024;
    return GetBuilder<HomeMainController>(
      init: HomeMainController(),
      builder: (controller) => Scaffold(
        backgroundColor: Themes.whiteColor,
        appBar: AppBar(
            backgroundColor: Themes.ColorApp1,
            toolbarHeight: 75,
            title: Container(
              height: 75,
              child: Row(
                children: [
                  UserProfileWithNotification(heightValue: heightValue, widthValue: widthValue, profileUserResponseModel: controller.profileUserModel,),
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
        body: controller.PageList[controller.indexPage!],
        bottomNavigationBar: BottomNavigationBar(
          items: controller.navigationItem,
          selectedItemColor: Themes.ColorApp1,
          unselectedItemColor: Themes.ColorApp2,
          type: BottomNavigationBarType.fixed,
          onTap: (int? index) {
            setState(() {
              controller.indexPage = index;
            });
            controller.PageList[controller.indexPage!];
          },
          currentIndex: controller.indexPage!,
        ),
        drawer: Drawer(
          backgroundColor: Themes.whiteColor,
          child: ListView(
            children: [
              UserDetailsInMenu(widthValue: widthValue, profileUserResponseModel: controller.profileUserModel,),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Themes.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      WidgetMenuItem(title: 'my_account', widthValue: widthValue, image: Assets.iconsProfileMenuIcon,
                        onTap: () => Get.to(SettingProfileScreen()),),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      WidgetMenuItem(title: 'my_wallet', widthValue: widthValue, image: Assets.iconsWalletMenuIcon,
                        onTap: ()=>Get.to(const MyWalletScreen()),),
                      SizedBox(
                        height: heightValue * .7,
                      ),
                      WidgetMenuItem(title: 'my_addresses', widthValue: widthValue, image: Assets.iconsMyLocationMenuIcon,
                          onTap: () {
                            print(Get.find<StorageService>().GetToken);
                            CustomFlutterToast(Get.find<StorageService>().GetToken);
                          }),
                      SizedBox(
                        height: heightValue * 2.5,
                      ),
                      CirclerProgressIndicatorWidget(isLoading: controller.isLogout ? true : false),
                      SizedBox(
                        height: heightValue * 1.5,
                      ),
                      WidgetMenuItemLogOut(heightValue: heightValue, onTap: () => controller.logoutUser('Bearer '+Get.find<StorageService>().GetToken),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetMenuItem extends StatelessWidget {
  WidgetMenuItem({Key? key,required this.title, required this.image ,required this.widthValue, required this.onTap}) : super(key: key);

  String? title,image;
  double? widthValue;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  image!,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: widthValue! * 1,
                ),
                Text(
                  title!.tr,
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
    );
  }
}

class WidgetMenuItemLogOut extends StatelessWidget {
  WidgetMenuItemLogOut({Key? key, required this.heightValue,required this.onTap}) : super(key: key);
  double? heightValue;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              height: heightValue! * .7,
            ),
            Text(
              'log_out'.tr,
              style: TextStyle(
                color: Themes.ColorApp9,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetailsInMenu extends StatelessWidget {
  UserDetailsInMenu({required this.widthValue,required this.profileUserResponseModel});
  ProfileUserResponseModel? profileUserResponseModel;
  double? widthValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
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
                      profileUserResponseModel?.firstname != null ?'${profileUserResponseModel?.firstname} ${profileUserResponseModel?.lastname}' : '',
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
                          'account_number'.tr,
                          style: TextStyle(
                              fontSize: 13, color: Themes.ColorApp8),
                        ),
                        SizedBox(
                          width: widthValue! * .5,
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
    );
  }
}

class UserProfileWithNotification extends StatelessWidget {
  UserProfileWithNotification(
      {required this.heightValue, required this.widthValue,required this.profileUserResponseModel});

  ProfileUserResponseModel? profileUserResponseModel;
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
            'welcome_back'.tr,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Text(
               profileUserResponseModel?.firstname !=null ? '${profileUserResponseModel?.firstname} ${profileUserResponseModel?.lastname}' : '',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
            ],
          )
        ],
      )
    ]);
  }
}
