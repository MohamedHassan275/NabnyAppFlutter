import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/componant/CustomButtonWidget.dart';
import 'package:nabny/model/home_user_model.dart';
import 'package:nabny/screens/requirements_request_offer_price_screen/requirements_request_offer_price_screen.dart';

import '../../generated/assets.dart';
import '../../utils/Themes.dart';

class FactoryDetailsScreen extends StatelessWidget {
  FactoryDetailsScreen({Key? key, required this.companiesResponseModel}) : super(key: key);
  final Companies companiesResponseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // SafeArea لضمان عدم تداخل الأزرار مع حواف الشاشة العلوية
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Themes.ColorApp1),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded, color: Colors.redAccent),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // الجزء القابل للسكرول
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. الصورة في الأعلى
                  _buildMainImage(),

                  // 2. محتوى التفاصيل
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderSection(),
                        const SizedBox(height: 20),

                        // التبويبات
                        _InfoTabRow(companiesResponseModel: companiesResponseModel),

                        const SizedBox(height: 24),
                        const Divider(color: Color(0xFFF0F0F0), thickness: 1.5),
                        const SizedBox(height: 16),

                        // قسم عن الشركة
                        _buildAboutSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. الزرار ثابت في الأسفل (لضمان سهولة الوصول وعدم حدوث Overflow)
          _buildBottomButton(context),
        ],
      ),
    );
  }

  // --- مكونات البناء ---

  Widget _buildMainImage() {
    return Container(
      width: double.infinity,
      height: Get.height * 0.3, // يأخذ 30% من ارتفاع الشاشة
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: companiesResponseModel.image?.isNotEmpty == true
            ? Image.network(
                companiesResponseModel.image!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(Assets.imagesBackgroundFactoryDetails, fit: BoxFit.cover),
              )
            : Image.asset(Assets.imagesBackgroundFactoryDetails, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '${companiesResponseModel.name ?? 'اسم المصنع'}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Themes.ColorApp15,
                ),
              ),
            ),
            _buildRateBadge(),
          ],
        ),
        if (companiesResponseModel.category != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              '${companiesResponseModel.category}',
              style: const TextStyle(fontSize: 14, color: Themes.ColorApp8),
            ),
          ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'عن الشركة',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Themes.ColorApp15,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          companiesResponseModel.about?.isNotEmpty == true ? '${companiesResponseModel.about}' : 'لا يوجد وصف متاح حالياً لهذه الشركة.',
          style: const TextStyle(
            fontSize: 14,
            color: Themes.ColorApp8,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildRateBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Themes.ColorApp12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, size: 16, color: Themes.ColorApp13),
          const SizedBox(width: 4),
          Text(
            '${companiesResponseModel.rate ?? '0'}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Themes.ColorApp13),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, MediaQuery.of(context).padding.bottom + 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      child: CustomButtonImage(
        title: 'request_price2'.tr,
        hight: 52,
        onTap: () => Get.to(
          RequirementsRequestOfferPriceScreen(
            companyId: '${companiesResponseModel.id}',
            my_location: '',
          ),
        ),
      ),
    );
  }
}

// ── التبويبات (بدون تغيير في الـ Logic) ──
class _InfoTabRow extends StatelessWidget {
  const _InfoTabRow({required this.companiesResponseModel});
  final Companies companiesResponseModel;

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
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Themes.ColorApp4,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Icon(tab.$2, size: 22, color: Themes.ColorApp1),
                const SizedBox(height: 8),
                Text(
                  tab.$1,
                  style: const TextStyle(fontSize: 12, color: Themes.ColorApp15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
