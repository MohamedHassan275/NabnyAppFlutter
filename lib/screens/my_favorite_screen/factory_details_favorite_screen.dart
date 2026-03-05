import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/model/favouriteModel.dart';
import 'package:nabny/screens/requirements_request_offer_price_screen/requirements_request_offer_price_screen.dart';

import '../../generated/assets.dart';
import '../../utils/Themes.dart';

class FactoryDetailsFavoriteScreen extends StatelessWidget {
  FactoryDetailsFavoriteScreen(
      {Key? key, required this.favouriteResponseModel})
      : super(key: key);
  FavouriteResponseModel favouriteResponseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ── صورة الخلفية تملأ النصف العلوي ──
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: Get.height * 0.45,
            child: Image.asset(
              Assets.imagesBackgroundFactoryDetails,
              fit: BoxFit.cover,
            ),
          ),
          // ── تعتيم خفيف ──
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: Get.height * 0.45,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // ── أزرار رجوع ومفضلة ──
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const _CircleActionBtn(
                      icon: Icons.arrow_back_ios_rounded,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const _CircleActionBtn(
                      icon: Icons.favorite_rounded,
                      iconColor: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ── كارت التفاصيل ──
          Positioned(
            top: Get.height * 0.38,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── اسم + تقييم ──
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${favouriteResponseModel.name ?? ''}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Themes.ColorApp15,
                                ),
                              ),
                              if (favouriteResponseModel.category != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    '${favouriteResponseModel.category}',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Themes.ColorApp8,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Themes.ColorApp12,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star_rounded,
                                  size: 14, color: Themes.ColorApp13),
                              const SizedBox(width: 4),
                              Text(
                                '${favouriteResponseModel.rate ?? ''}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Themes.ColorApp13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // ── تبويبات ──
                    _InfoTabRow(),

                    const SizedBox(height: 20),
                    const Divider(color: Color(0xFFF0F0F0), height: 1),
                    const SizedBox(height: 16),

                    // ── عن الشركة ──
                    const Text(
                      'عن الشركة',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Themes.ColorApp15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      favouriteResponseModel.about?.isNotEmpty == true
                          ? '${favouriteResponseModel.about}'
                          : 'وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تفاصيل المنتجات أو وصف المصانع بالتفصيل. يمكن أيضاً أن يلتمس على الشمال أو منتصف الشاشة.',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Themes.ColorApp8,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── زرار الطلب ──
                    CustomButtonImage(
                      title: 'request_price2'.tr,
                      hight: 52,
                      onTap: () => Get.to(
                        RequirementsRequestOfferPriceScreen(
                          companyId: '${favouriteResponseModel.id}',
                          my_location: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTabRow extends StatelessWidget {
  const _InfoTabRow();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ('طلبات', Icons.receipt_long_rounded),
      ('المحدد', Icons.check_circle_outline_rounded),
      ('فوائد', Icons.star_outline_rounded),
    ];
    return Row(
      children: tabs.map((tab) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Themes.ColorApp4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(tab.$2, size: 20, color: Themes.ColorApp1),
                const SizedBox(height: 4),
                Text(
                  tab.$1,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Themes.ColorApp15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _CircleActionBtn extends StatelessWidget {
  const _CircleActionBtn({required this.icon, this.iconColor});
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(icon, size: 18, color: iconColor ?? Themes.ColorApp1),
      ),
    );
  }
}
