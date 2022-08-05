import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/screens/my_order_screen/my_sender_order_screen/my_sender_order_screen.dart';
import 'package:nabny/screens/my_order_screen/my_wating_order_screen/my_waiting_order_controller.dart';

import '../../utils/Themes.dart';
import 'my_current_order_screen/my_current_order_screen.dart';
import 'my_previous_order_screen/my_previous_order_screen.dart';
import 'my_wating_order_screen/my_waiting_order_screen.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Themes.ColorApp1,
            child: Column(
              children: <Widget>[
                Expanded(child: new Container()),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Themes.whiteColor,
                    labelColor: Themes.ColorApp1,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // Creates border
                        color: Themes.whiteColor),
                    tabs: [
                      Tab(text: 'request_offer_price2'.tr),
                      Tab(text: 'my_active_requests'.tr),
                      Tab(text: 'my_active_current'.tr),
                      Tab(text: 'my_previous_requests'.tr),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(children: <Widget>[
          MyWaitingOrderScreen(),
          MySenderOrderScreen(),
          MyCurrentOrderScreen(),
          MyPreviousOrderScreen(),
        ]),
      ),
    );
  }
}
