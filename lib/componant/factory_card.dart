import 'package:flutter/material.dart';
import 'package:nabny/generated/assets.dart';
import 'package:nabny/utils/Themes.dart';

/// كارت المصنع الموحد لكل التطبيق
/// يُستخدم في: HomeScreen / CategoryDetailsScreen / MyFavoriteScreen
class FactoryCard extends StatelessWidget {
  const FactoryCard({
    Key? key,
    required this.name,
    required this.rate,
    required this.distance,
    required this.imageUrl,
    this.imageAsset,
    required this.onTap,
    this.trailing,     // مثلاً زرار المفضلة
  }) : super(key: key);

  final String name;
  final String? rate;
  final String? distance;
  final String? imageUrl;
  final String? imageAsset;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final heightValue = MediaQuery.of(context).size.height * 0.024;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 14,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── صورة المصنع ──
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18)),
                  child: imageUrl != null && imageUrl!.isNotEmpty
                      ? FadeInImage(
                          image: NetworkImage(imageUrl!),
                          fit: BoxFit.cover,
                          height: 170,
                          width: double.infinity,
                          placeholder:
                              const AssetImage(Assets.imagesFactoryImage),
                          imageErrorBuilder: (_, __, ___) => Image.asset(
                            Assets.imagesFactoryImage,
                            fit: BoxFit.cover,
                            height: 170,
                            width: double.infinity,
                          ),
                        )
                      : Image.asset(
                          imageAsset ?? Assets.imagesFactoryImage,
                          fit: BoxFit.cover,
                          height: 170,
                          width: double.infinity,
                        ),
                ),
                // ── تعتيم تدريجي سفلي ──
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(18)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.25),
                        ],
                      ),
                    ),
                  ),
                ),
                // ── تقييم فوق الصورة ──
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Themes.ColorApp12,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star_rounded,
                            size: 13, color: Themes.ColorApp13),
                        const SizedBox(width: 3),
                        Text(
                          rate ?? '0',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Themes.ColorApp13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ── trailing (مثلاً زرار المفضلة) ──
                if (trailing != null)
                  Positioned(top: 10, right: 10, child: trailing!),
              ],
            ),

            // ── تفاصيل المصنع ──
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  // أيقونة المصنع
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp4,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Themes.ColorApp14, width: 1),
                    ),
                    child: Center(
                      child: Image.asset(
                        Assets.iconsFactoryNamIcon,
                        width: 28,
                        height: 28,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // الاسم
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Themes.ColorApp15,
                          ),
                        ),
                        if (distance != null && distance!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                const Icon(Icons.location_on_outlined,
                                    size: 13, color: Themes.ColorApp8),
                                const SizedBox(width: 3),
                                Text(
                                  '$distance km',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Themes.ColorApp8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  // سهم الدخول
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Themes.ColorApp4,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      color: Themes.ColorApp1,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
