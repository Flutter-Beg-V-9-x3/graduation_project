// import 'package:flutter/material.dart';
// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/theme/app_text_styles.dart';

// class ActionRatingSection extends StatelessWidget {
//   const ActionRatingSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       // تقليل المسافات الجانبية لتناسب العناصر الأصغر
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//       child: Row(
//         children: [
//           // 1. زر مشاهدة العرض الدعائي (Watch Trailer)
//           Expanded(
//             child: Container(
//               height: 48, // تصغير الارتفاع (الملاحظة 2)
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.primary.withOpacity(0.3),
//                     blurRadius: 15,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: ElevatedButton.icon(
//                 onPressed: () {},
//                 // أيقونة أصغر وأبسط
//                 icon: const Icon(Icons.play_arrow_rounded, size: 22),
//                 label: const Text("Watch Trailer"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   foregroundColor: Colors.white,
//                   // تصغير حجم الخط ليناسب حجم الزر الجديد
//                   textStyle: AppTextStyles.button.copyWith(fontSize: 14),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(width: 12),

//           // 2. زر الحفظ (Bookmark)
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               height: 48, // توحيد الارتفاع الصغير (الملاحظة 2)
//               width: 48,  // توحيد العرض
//               decoration: BoxDecoration(
//                 color: AppColors.surfaceAlt,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(
//                   color: Colors.white.withOpacity(0.08),
//                   width: 1,
//                 ),
//               ),
//               child: Icon(
//                 // تغيير شكل الأيقونة لتكون أنحف (الملاحظة 1)
//                 Icons.bookmark_outline_rounded,
//                 color: Colors.white.withOpacity(0.9),
//                 size: 22,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ActionRatingSection extends StatefulWidget {
  const ActionRatingSection({super.key});

  @override
  State<ActionRatingSection> createState() => _ActionRatingSectionState();
}

class _ActionRatingSectionState extends State<ActionRatingSection> {
  bool isBookmarkHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          // 1. زر مشاهدة العرض الدعائي (Watch Trailer)
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: OutlinedButton.icon(
                // استخدمنا OutlinedButton ليكون مفرغاً من الداخل
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow_outlined,
                  size: 22,
                ), // سهم مفرغ من الداخل
                label: const Text("Watch Trailer"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.primary.withOpacity(
                    0.1,
                  ), // خلفية خفيفة جداً
                  textStyle: AppTextStyles.button.copyWith(fontSize: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 2. زر الحفظ (Bookmark) مع تأثير Hover
          MouseRegion(
            onEnter: (_) => setState(() => isBookmarkHovered = true),
            onExit: (_) => setState(() => isBookmarkHovered = false),
            child: GestureDetector(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  // يتغير اللون عند تمرير الماوس ليصبح "Full"
                  color: isBookmarkHovered
                      ? Colors.white
                      : AppColors.surfaceAlt,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isBookmarkHovered
                        ? Colors.white
                        : Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Icon(
                  // تتغير الأيقونة عند التمرير لتظهر الإشارة والزائد
                  isBookmarkHovered
                      ? Icons.bookmark_add
                      : Icons.bookmark_add_outlined,
                  color: isBookmarkHovered
                      ? AppColors.background
                      : Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
