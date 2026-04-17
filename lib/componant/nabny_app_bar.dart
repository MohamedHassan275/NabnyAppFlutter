import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nabny/utils/Themes.dart';

/// AppBar موحد لكل التطبيق
/// - خلفية بيضاء بظل خفيف (card style)
/// - زر الرجوع يتجه يمين (عربي) أو يسار (إنجليزي) تلقائياً
/// - يمكن تخصيص العنوان والأفعال وزر الرجوع
class NabnyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NabnyAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.showBack = true,
    this.onBack,
    this.actions,
    this.backgroundColor = Colors.white,
    this.bottomWidget,
    this.height = 62,
  }) : super(key: key);

  /// النص في المنتصف (اختياري)
  final String? title;

  /// widget بدلاً من النص (أولوية أعلى من title)
  final Widget? titleWidget;

  /// هل يظهر زر الرجوع؟
  final bool showBack;

  /// callback مخصص لزر الرجوع (لو null يستخدم Get.back)
  final VoidCallback? onBack;

  /// أيقونات الجانب الأيسر/الأيمن
  final List<Widget>? actions;

  /// لون الخلفية
  final Color backgroundColor;

  /// widget إضافية أسفل الـ AppBar (مثلاً TabBar)
  final PreferredSizeWidget? bottomWidget;

  /// الارتفاع الكلي
  final double height;


  IconData get _backIcon => Icons.arrow_back_ios_rounded;

  @override
  Size get preferredSize => Size.fromHeight(
        height + (bottomWidget?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    // نستخدم Directionality.of للفهم الصحيح لمحاذاة النص
    // لكن نجبر Row على يكون LTR دايماً عشان الأيقونة تبقى على الشمال
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                // نجبر الـ Row على LTR دايماً عشان الأيقونة تبقى على الشمال
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    children: [
                      // ── زر الرجوع دايماً على الشمال ──
                      if (showBack)
                        _BackButton(
                          icon: _backIcon,
                          onTap: onBack ?? () => Get.back(),
                        )
                      else
                        const SizedBox(width: 48),

                      // ── العنوان في المنتصف ──
                      Expanded(
                        child: Center(
                          child: titleWidget ??
                              (title != null
                                  ? Text(
                                      title!,
                                      style: const TextStyle(
                                        color: Themes.ColorApp15,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.2,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : const SizedBox()),
                        ),
                      ),

                      // ── الأفعال على اليمين ──
                      if (actions != null && actions!.isNotEmpty)
                        Row(mainAxisSize: MainAxisSize.min, children: actions!)
                      else
                        const SizedBox(width: 48),
                    ],
                  ),
                ),
              ),
            ),

            // ── bottomWidget (مثل TabBar) ──
            if (bottomWidget != null) bottomWidget!,
          ],
        ),
    );
  }
}

/// زر الرجوع الدائري
class _BackButton extends StatelessWidget {
  const _BackButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Themes.ColorApp4,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Themes.ColorApp14, width: 1),
          ),
          child: Center(
            child: Icon(icon, size: 18, color: Themes.ColorApp1),
          ),
        ),
      ),
    );
  }
}
