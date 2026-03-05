import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/LoadingWidget.dart';
import 'package:nabny/componant/factory_card.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/screens/factory_details_screen/factory_details_screen.dart';
import 'package:nabny/screens/home_main_screen/home_main_controller.dart';
import 'package:nabny/screens/home_screen/home_controller.dart';
import 'package:nabny/screens/my_order_screen/my_current_order_screen/my_current_order_controller.dart';
import 'package:nabny/screens/my_order_screen/my_previous_order_screen/my_previous_order_controller.dart';
import 'package:nabny/screens/my_order_screen/my_sender_order_screen/my_send_order_controller.dart';
import 'package:nabny/screens/request_offer_price_screen/request_offer_price_controller.dart';
import 'package:nabny/utils/Themes.dart';
import '../../model/home_user_model.dart';
import '../category_details_screen/category_details_screen.dart';
import '../location_map_user_screen/google_map_locaiton_user_screen.dart';
import '../requirements_request_offer_price_screen/requirements_request_offer_price_screen.dart';
import 'package:nabny/screens/my_order_screen/my_wating_order_screen/my_waiting_order_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    HomeMainController homeMainController = Get.find<HomeMainController>();
    MyNewOrderController myNewOrderController = Get.find<MyNewOrderController>();
    MySendOrderController mySendOrderController = Get.find<MySendOrderController>();
    MyCurrentOrderController myCurrentOrderController = Get.find<MyCurrentOrderController>();
    MyPreviousOrderController myPreviousOrderController = Get.find<MyPreviousOrderController>();
    RequestOfferPriceController requestOfferPriceController = Get.find<RequestOfferPriceController>();

    return Scaffold(
      backgroundColor: Themes.ColorApp7,
      body: RefreshIndicator(
        color: Themes.ColorApp1,
        onRefresh: () async {
          homeController.getHomeDetailsUser();
          homeMainController.getProfileDetailsUser();
          myNewOrderController.getMyNewOrderUser();
          mySendOrderController.getMySendOrderUser();
          myCurrentOrderController.getMyOrderUser();
          myPreviousOrderController.getPreviousMyOrderUser();
          requestOfferPriceController.getRequestOfferPrice();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                if (controller.isLoading) {
                  return SizedBox(
                    height: Get.height * 0.8,
                    child: LoadingWidget(data: ''),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ══════════════════════════════
                    // 0) Header – يشبه AppBar مدمج
                    // ══════════════════════════════
                    _HomeHeader(homeController: controller, homeMainController: homeMainController),

                    const SizedBox(height: 12),

                    // ══════════════════════════════
                    // 1) Carousel Slider
                    // ══════════════════════════════
                    _HomeCarousel(controller: controller),

                    const SizedBox(height: 16),

                    // ══════════════════════════════
                    // 2) سيرش بار "ابحث عن مصنع"
                    // ══════════════════════════════
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _SearchBar(),
                    ),

                    const SizedBox(height: 20),

                    // ══════════════════════════════
                    // 3) كل الفئات
                    // ══════════════════════════════
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _CategoriesSection(
                        homeUserResponseModel: controller.homeUserModel,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ══════════════════════════════
                    // 4) طلب عروض أسعار
                    // ══════════════════════════════
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _OrderPriceCard(),
                    ),

                    const SizedBox(height: 20),

                    // ══════════════════════════════
                    // 5) بعض المصانع
                    // ══════════════════════════════
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'some_factories'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: Themes.ColorApp15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<HomeController>(
                      builder: (ctrl) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: ctrl.homeUserModel?.companies?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: FactoryItemList(
                                companiesModel:
                                    ctrl.homeUserModel?.companies?[index],
                                homeController: homeController,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Carousel Widget
// ─────────────────────────────────────────────
class _HomeCarousel extends StatefulWidget {
  const _HomeCarousel({required this.controller});
  final HomeController controller;

  @override
  State<_HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<_HomeCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sliders = widget.controller.homeUserModel?.sliders ?? [];
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          child: CarouselSlider(
            items: sliders
                .map((e) => SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        '${e.image}',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Themes.ColorApp4,
                          child: const Icon(Icons.factory_outlined,
                              color: Themes.ColorApp1, size: 50),
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 210,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, _) {
                setState(() => _currentIndex = index);
              },
            ),
          ),
        ),
        // Dot indicators
        if (sliders.isNotEmpty)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sliders.asMap().entries.map((entry) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentIndex == entry.key ? 20 : 7,
                  height: 7,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _currentIndex == entry.key
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// Search Bar Widget
// ─────────────────────────────────────────────
class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Icon(Icons.search_rounded, color: Themes.ColorApp8, size: 22),
            const SizedBox(width: 10),
            Text(
              'Looking_factory'.tr,
              style: TextStyle(
                fontSize: 14,
                color: Themes.ColorApp8,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Categories Section - Grid 3 columns
// ─────────────────────────────────────────────
class _CategoriesSection extends StatelessWidget {
  const _CategoriesSection({required this.homeUserResponseModel});
  final HomeUserResponseModel? homeUserResponseModel;

  @override
  Widget build(BuildContext context) {
    final categories = homeUserResponseModel?.categories ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'all_categories'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Themes.ColorApp15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            return GestureDetector(
              onTap: () => Get.to(CategoryDetailsScreen(categories: cat)),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Themes.ColorApp14, width: 1.2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // أيقونة الفئة
                    Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage(
                          image: NetworkImage('${cat.image}'),
                          fit: BoxFit.contain,
                          placeholder:
                              const AssetImage(Assets.imagesFactoryImage),
                          imageErrorBuilder: (_, __, ___) => const Icon(
                            Icons.factory_outlined,
                            color: Themes.ColorApp1,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // اسم الفئة
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        '${cat.name ?? ''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Themes.ColorApp15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    // عدد العناصر
                    Text(
                      '${cat.count ?? 0} \u0645\u0646\u062a\u062c',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Themes.ColorApp8.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// Order Price Card Widget
// ─────────────────────────────────────────────
class _OrderPriceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAr = Get.locale?.languageCode == 'ar';
    return GestureDetector(
      onTap: () => Get.to(
          RequirementsRequestOfferPriceScreen(companyId: '', my_location: '')),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Themes.ColorApp1.withOpacity(0.15), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // النص والأيقونة
            Row(
              children: [
                 // سهم الانتقال
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Themes.ColorApp4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      Assets.imagesOrderPriceImage,
                      fit: BoxFit.contain,
                      color: Themes.ColorApp1,
                    ),
                  ),
                ),
                 const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'request_offer_price'.tr,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Themes.ColorApp15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'request_offer_price2'.tr,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Themes.ColorApp8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
               Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Themes.ColorApp4,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                isAr
                    ? Icons.keyboard_arrow_left_rounded
                    : Icons.keyboard_arrow_right_rounded,
                size: 22,
                color: Themes.ColorApp1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Factory Item in List (uses unified FactoryCard)
// ─────────────────────────────────────────────
class FactoryItemList extends StatelessWidget {
  FactoryItemList({required this.companiesModel, required this.homeController});

  Companies? companiesModel;
  HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return FactoryCard(
      name: '${companiesModel?.name ?? ''}',
      rate: '${companiesModel?.rate ?? ''}',
      distance: '${companiesModel?.distance ?? ''}',
      imageUrl: '${companiesModel?.image ?? ''}',
      onTap: () => Get.to(
        FactoryDetailsScreen(companiesResponseModel: companiesModel!),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Kept for backward compatibility (unused in new design)
// ─────────────────────────────────────────────
class LookingForFactory extends StatelessWidget {
  LookingForFactory({required this.widthValue});
  double? heightValue, widthValue;

  @override
  Widget build(BuildContext context) {
    return _SearchBar();
  }
}

class SearchForSomeFactories extends StatelessWidget {
  SearchForSomeFactories(
      {Key? key,
      required this.homeUserResponseModel,
      required this.onTap,
      required this.heightValue,
      required this.widthValue})
      : super(key: key);

  HomeUserResponseModel? homeUserResponseModel;
  double heightValue, widthValue;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class DetailsCompany extends StatelessWidget {
  DetailsCompany(
      {required this.CompaniesModel,
      required this.heightValue,
      required this.widthValue});

  Companies? CompaniesModel;
  double heightValue, widthValue;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class CategoryListBuild extends StatelessWidget {
  CategoryListBuild(
      {required this.heightValue, required this.homeUserResponseModel});

  HomeUserResponseModel? homeUserResponseModel;
  double heightValue;

  @override
  Widget build(BuildContext context) {
    return _CategoriesSection(homeUserResponseModel: homeUserResponseModel);
  }
}

class OrderPriceRequest extends StatelessWidget {
  OrderPriceRequest({required this.heightValue});
  double heightValue;

  @override
  Widget build(BuildContext context) {
    return _OrderPriceCard();
  }
}

// ─────────────────────────────────────────────
// Home Header Widget - يطابق الصورة بالضبط
// ─────────────────────────────────────────────
class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.homeController,
    required this.homeMainController,
  });
  final HomeController homeController;
  final HomeMainController homeMainController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      child: GetBuilder<HomeMainController>(
        builder: (mainCtrl) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── صف العلوي: إشعارات + بروفايل ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // زرار الإشعارات (يسار)
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Themes.ColorApp1.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_none_rounded,
                    color: Themes.ColorApp1,
                    size: 24,
                  ),
                ),

                // التحية + البروفايل (يمين)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'welcome_back'.tr,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Themes.ColorApp1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          mainCtrl.profileUserModel?.firstname != null
                              ? '${mainCtrl.profileUserModel?.firstname} ${mainCtrl.profileUserModel?.lastname ?? ''}'
                              : '',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Themes.ColorApp15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Themes.ColorApp4,
                        shape: BoxShape.circle,
                        border: Border.all(color: Themes.ColorApp14, width: 1.5),
                        image: DecorationImage(
                          image: mainCtrl.profileUserModel?.image != null
                              ? NetworkImage(mainCtrl.profileUserModel!.image!)
                              : const AssetImage(Assets.imagesImageLogoApp)
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ── التوصيل إلى (Box) ──
            Text(
              'delivery_to'.tr,
              style: TextStyle(
                fontSize: 11,
                color: Themes.ColorApp8.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            GetBuilder<HomeController>(
              builder: (homeCtrl) => GestureDetector(
                onTap: () => Get.to(const GoogleMapLocationUserScreen()),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Themes.ColorApp14, width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_rounded, size: 18, color: Themes.ColorApp1),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          homeCtrl.homeUserModel?.currentLocation?.address != null
                              ? '${homeCtrl.homeUserModel!.currentLocation!.address}'
                              : 'choose_location'.tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Themes.ColorApp8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        Get.locale?.languageCode == 'ar'
                            ? Icons.keyboard_arrow_left_rounded
                            : Icons.keyboard_arrow_right_rounded,
                        color: Themes.ColorApp8,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
