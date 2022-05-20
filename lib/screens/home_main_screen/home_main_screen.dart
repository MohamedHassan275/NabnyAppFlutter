import 'package:flutter/material.dart';
import 'package:nabny/screens/home_main_screen/home_main_controller.dart';
import 'package:provider/provider.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    HomeMainController homeMainController =
        Provider.of<HomeMainController>(context);
    return Scaffold(
      body: homeMainController.PageList[homeMainController.indexPage!],
      bottomNavigationBar: BottomNavigationBar(
        items: homeMainController.navigationItem,
        onTap: (int? index){
          setState(() {
            homeMainController.indexPage = index;
          });
          homeMainController.PageList[homeMainController.indexPage!];
        },
        currentIndex: homeMainController.indexPage!,
      ),
    );
  }
}
