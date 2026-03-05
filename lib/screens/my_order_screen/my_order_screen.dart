import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/screens/my_order_screen/my_current_order_screen/my_current_order_controller.dart';
import 'package:nabny/screens/my_order_screen/my_previous_order_screen/my_previous_order_controller.dart';
import 'package:nabny/screens/my_order_screen/my_sender_order_screen/my_send_order_controller.dart';
import 'package:nabny/screens/my_order_screen/my_sender_order_screen/my_sender_order_screen.dart';
import 'package:nabny/screens/my_order_screen/my_wating_order_screen/my_waiting_order_controller.dart';

import '../../utils/Themes.dart';
import 'my_current_order_screen/my_current_order_screen.dart';
import 'my_previous_order_screen/my_previous_order_screen.dart';
import 'my_wating_order_screen/my_waiting_order_screen.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<_TabItem> _tabs = const [
    _TabItem(label: 'request_offer_price2', icon: Icons.receipt_long_outlined),
    _TabItem(label: 'my_active_requests',   icon: Icons.send_outlined),
    _TabItem(label: 'my_active_current',    icon: Icons.pending_actions_outlined),
    _TabItem(label: 'my_previous_requests', icon: Icons.history_outlined),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    Get.put(MyNewOrderController());
    Get.put(MySendOrderController());
    Get.put(MyCurrentOrderController());
    Get.put(MyPreviousOrderController());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.ColorApp7,
      appBar: _OrderAppBar(tabController: _tabController, tabs: _tabs),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyWaitingOrderScreen(),
          const MySenderOrderScreen(),
          const MyCurrentOrderScreen(),
          const MyPreviousOrderScreen(),
        ],
      ),
    );
  }
}

// ── بيانات كل تاب ──
class _TabItem {
  const _TabItem({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

// ── AppBar مخصص مع TabBar ──
class _OrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _OrderAppBar({
    required this.tabController,
    required this.tabs,
  });

  final TabController tabController;
  final List<_TabItem> tabs;

  @override
  Size get preferredSize => const Size.fromHeight(118);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── صف العنوان + زر الرجوع ──
            // SizedBox(
            //   height: 56,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 12),
            //     child: Row(
            //       children: [
            //         _AppBarBackButton(),
            //         const Expanded(
            //           child: Center(
            //             child: Text(
            //               'طلباتي',
            //               style: TextStyle(
            //                 color: Themes.ColorApp15,
            //                 fontSize: 17,
            //                 fontWeight: FontWeight.w700,
            //                 letterSpacing: 0.3,
            //               ),
            //             ),
            //           ),
            //         ),
            //         const SizedBox(width: 40), // توازن
            //       ],
            //     ),
            //   ),
            // ),

            // ── TabBar ──
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Themes.ColorApp4,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Themes.ColorApp14, width: 1),
                ),
                child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  padding: const EdgeInsets.all(4),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Themes.ColorApp1,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Themes.ColorApp1.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Themes.ColorApp8,
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: tabs.map((t) {
                    return Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(t.icon, size: 15),
                          const SizedBox(width: 5),
                          Text(t.label.tr),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Themes.ColorApp4,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Themes.ColorApp14, width: 1),
        ),
        child: Center(
          child: Icon(
            isArabic
                ? Icons.arrow_forward_ios_rounded
                : Icons.arrow_back_ios_rounded,
            size: 18,
            color: Themes.ColorApp1,
          ),
        ),
      ),
    );
  }
}
