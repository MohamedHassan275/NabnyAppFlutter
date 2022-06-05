import 'package:flutter/material.dart';

import '../../utils/Themes.dart';
import 'my_current_order_screen/my_current_order_screen.dart';
import 'my_old_order_screen/my_old_order_screen.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Themes.ColorApp1,
            child: Column(
              children: <Widget>[
                Expanded(child: new Container()),
               Padding(padding: EdgeInsets.all(3),
               child:  TabBar(
                 isScrollable: true,
                 unselectedLabelColor: Themes.whiteColor,
                 labelColor: Themes.ColorApp1,
                 indicator: BoxDecoration(
                     borderRadius: BorderRadius.circular(25), // Creates border
                     color: Themes.whiteColor),
                 tabs: [
                   Tab(text: 'طلباتي الحالي'),
                   Tab( text: 'طلباتي السابقه'),
                 ],
               ),)

              ],
            ),
          ),),
        body: TabBarView(children: <Widget>[
          MyCurrentOrderScreen(),
          MyOldOrderScreen(),
        ]),
      ),
    );
  }
}
