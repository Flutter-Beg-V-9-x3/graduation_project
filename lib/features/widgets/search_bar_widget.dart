// import 'package:flutter/material.dart';
// import '../../../core/theme/app_colors.dart';
// import '../../../core/theme/app_text_styles.dart';

// class HomeSearchBar extends StatefulWidget {
//   const HomeSearchBar({super.key});

//   @override
//   State<HomeSearchBar> createState() => _HomeSearchBarState();
// }

// class _HomeSearchBarState extends State<HomeSearchBar> {
//   bool _isHovered = false;
//   final FocusNode _focusNode = FocusNode(); // للتحكم بحالة الكتابة
//   bool _isFocused = false;

//   @override
//   void initState() {
//     super.initState();
//     // الاستماع لحالة الـ Focus (هل المستخدم يكتب الآن؟)
//     _focusNode.addListener(() {
//       setState(() {
//         _isFocused = _focusNode.hasFocus;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//       child: MouseRegion(
//         onEnter: (_) => setState(() => _isHovered = true),
//         onExit: (_) => setState(() => _isHovered = false),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           height: 54,
//           decoration: BoxDecoration(
//             color: const Color(0xFF251B2F),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(
//               // إذا كان المستخدم يكتب (Focused) يصبح اللون بنفسجي، وإلا يبقى رمادي باهت
//               color: _isFocused
//                   ? AppColors.primary
//                   : Colors.white.withOpacity(_isHovered ? 0.2 : 0.08),
//               width: _isFocused ? 1.5 : 1.0,
//             ),
//             // إضافة توهج بسيط (Glow) عند الكتابة مثل السكرين
//             boxShadow: _isFocused
//                 ? [
//                     BoxShadow(
//                       color: AppColors.primary.withOpacity(0.15),
//                       blurRadius: 10,
//                       spreadRadius: 1,
//                     ),
//                   ]
//                 : [],
//           ),
//           child: Row(
//             children: [
//               const SizedBox(width: 16),
//               // أيقونة البحث تتأثر بالـ Hover والـ Focus
//               AnimatedIcon(
//                 icon: Icons.search,
//                 color: (_isFocused || _isHovered)
//                     ? AppColors.primary
//                     : Colors.white.withOpacity(0.3),
//               ),
//               const SizedBox(width: 12),

//               // حقل الإدخال
//               Expanded(
//                 child: TextField(
//                   focusNode: _focusNode,
//                   style: AppTextStyles.input.copyWith(
//                     color: Colors.white,
//                     fontSize: 15,
//                   ),
//                   decoration: InputDecoration(
//                     hintText: "Search movies, actors...",
//                     hintStyle: TextStyle(
//                       color: Colors.white.withOpacity(0.25),
//                       fontSize: 14,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),

//               // الفاصل الرأسي يختفي عند الكتابة ليعطي شكل أنظف
//               AnimatedOpacity(
//                 duration: const Duration(milliseconds: 200),
//                 opacity: _isFocused ? 0.0 : 1.0,
//                 child: Container(
//                   height: 24,
//                   width: 1,
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   color: Colors.white.withOpacity(0.1),
//                 ),
//               ),

//               // زر الفلتر
//               Container(
//                 margin: const EdgeInsets.all(4),
//                 width: 46,
//                 height: 46,
//                 decoration: BoxDecoration(
//                   color: _isHovered
//                       ? AppColors.primary.withOpacity(0.1)
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Icon(
//                   Icons.tune,
//                   color: _isHovered
//                       ? AppColors.primary
//                       : Colors.white.withOpacity(0.4),
//                   size: 20,
//                 ),
//               ),
//               const SizedBox(width: 4),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ويدجت داخلي بسيط لتغيير لون الأيقونة بسلاسة
// class AnimatedIcon extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   const AnimatedIcon({super.key, required this.icon, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder<Color?>(
//       duration: const Duration(milliseconds: 200),
//       tween: ColorTween(begin: color, end: color),
//       builder: (context, value, child) {
//         return Icon(icon, color: value, size: 22);
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  bool _isMainBoxHovered = false;
  bool _isFilterHovered = false;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // المسافات الخارجية (Margin) لتوسيط البحث
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isMainBoxHovered = true),
        onExit: (_) => setState(() => _isMainBoxHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 52, // تقليل الارتفاع قليلاً ليصبح "أنحف" مثل السكرين
          padding: const EdgeInsets.only(left: 16, right: 8),
          decoration: BoxDecoration(
            // اللون مطابق لـ surface-dark في ملف الـ HTML
            color: const Color(0xFF251B2F),
            borderRadius: BorderRadius.circular(14), // زوايا أقل حدة قليلاً
            border: Border.all(
              // حدود خفيفة جداً في الحالة العادية
              color: _isFocused
                  ? AppColors.primary
                  : Colors.white.withOpacity(_isMainBoxHovered ? 0.12 : 0.06),
              width: 1.0,
            ),
            // توهج ناعم جداً عند الكتابة
            boxShadow: _isFocused
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.08),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              // أيقونة البحث - لون هادئ جداً
              Icon(
                Icons.search,
                size: 22,
                color: (_isFocused || _isMainBoxHovered)
                    ? AppColors.primary
                    : Colors.white.withOpacity(0.25),
              ),
              const SizedBox(width: 12),

              // حقل النص
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  // استخدام TextStyle بسيط ومطابق للسكرين
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.5,
                    fontFamily: 'Be Vietnam Pro', // كما في الـ HTML
                  ),
                  cursorColor: AppColors.primary,
                  decoration: InputDecoration(
                    hintText: "Search movies, actors...",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.2),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),

              // زر الفلتر - شفاف تماماً ويبرز فقط عند الـ Hover
              MouseRegion(
                onEnter: (_) => setState(() => _isFilterHovered = true),
                onExit: (_) => setState(() => _isFilterHovered = false),
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    // خلفية رمادية خفيفة جداً عند تمرير الماوس فوق الفلتر فقط
                    color: _isFilterHovered
                        ? Colors.white.withOpacity(0.05)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.tune,
                    size: 19,
                    color: _isFilterHovered
                        ? AppColors.primary
                        : Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
