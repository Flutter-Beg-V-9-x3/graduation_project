// // import 'package:flutter/material.dart';
// // import 'dart:ui';
// // import '../../../../core/theme/app_colors.dart';
// // import '../../../../core/theme/app_text_styles.dart';

// // class HeaderWidget extends StatefulWidget {
// //   const HeaderWidget({super.key});

// //   @override
// //   State<HeaderWidget> createState() => _HeaderWidgetState();
// // }

// // class _HeaderWidgetState extends State<HeaderWidget> {
// //   bool isFavorite = false;
// //   bool isHovered = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         // 1. الخلفية المتدرجة
// //         _buildBackground(),

// //         // 2. المحتوى
// //         SafeArea(
// //           child: Column(
// //             children: [
// //               const SizedBox(height: 10), // مسافة إضافية من فوق (الملاحظة 1)
// //               _buildTopActionButtons(),
// //               const SizedBox(height: 15),
// //               _buildInteractivePoster(),
// //               const SizedBox(height: 20),
// //               Text('Interstellar', style: AppTextStyles.movieTitleLarge),
// //               const SizedBox(height: 4),
// //               Text(
// //                 'Sci-Fi • Adventure • Drama',
// //                 style: AppTextStyles.movieInfoSemiBold.copyWith(
// //                   color: Colors.white.withOpacity(
// //                     0.7,
// //                   ), // اللون الأبيض الهادئ (الملاحظة 2)
// //                 ),
// //               ),
// //               const SizedBox(height: 15),
// //               _buildMovieInfoBadges(),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildBackground() {
// //     return Container(
// //       height: 450, // تقليل طول الخلفية قليلاً لتناسب العناصر
// //       width: double.infinity,
// //       decoration: const BoxDecoration(
// //         image: DecorationImage(
// //           image: AssetImage('assets/images/The Creator.jpg'),
// //           fit: BoxFit.cover,
// //         ),
// //       ),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [
// //               Colors.black.withOpacity(0.3),
// //               AppColors.background.withOpacity(0.8),
// //               AppColors.background,
// //             ],
// //             stops: const [0.0, 0.7, 1.0],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTopActionButtons() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 20),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           _buildCircleBtn(
// //             Icons.arrow_back_ios_new, // أيقونة أنحف وأجمل
// //             onTap: () => Navigator.pop(context),
// //           ),
// //           Row(
// //             children: [
// //               _buildCircleBtn(Icons.share_outlined, onTap: () {}),
// //               const SizedBox(width: 12),
// //               _buildCircleBtn(
// //                 isFavorite ? Icons.favorite : Icons.favorite_border,
// //                 color: isFavorite ? Colors.red : Colors.white,
// //                 onTap: () => setState(() => isFavorite = !isFavorite),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildInteractivePoster() {
// //     return MouseRegion(
// //       onEnter: (_) => setState(() => isHovered = true),
// //       onExit: (_) => setState(() => isHovered = false),
// //       child: GestureDetector(
// //         onTap: () => print("Play Trailer"),
// //         child: AnimatedContainer(
// //           duration: const Duration(milliseconds: 300),
// //           width: 170, // تصغير العرض (الملاحظة 3)
// //           height: 250, // تصغير الطول (الملاحظة 3)
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(20),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: AppColors.primary.withOpacity(isHovered ? 0.5 : 0.2),
// //                 blurRadius: isHovered ? 40 : 20,
// //                 spreadRadius: 1,
// //               ),
// //             ],
// //             image: const DecorationImage(
// //               image: AssetImage('assets/images/The Creator.jpg'),
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           child: AnimatedOpacity(
// //             duration: const Duration(milliseconds: 200),
// //             opacity: isHovered ? 1.0 : 0.0,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(20),
// //                 color: Colors.black.withOpacity(0.4),
// //               ),
// //               child: Center(
// //                 child: ClipOval(
// //                   child: BackdropFilter(
// //                     filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
// //                     child: Container(
// //                       padding: const EdgeInsets.all(10),
// //                       color: Colors.white.withOpacity(0.2),
// //                       child: const Icon(
// //                         Icons.play_arrow_rounded,
// //                         size: 40,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildMovieInfoBadges() {
// //     return Wrap(
// //       spacing: 8, // تقليل المسافة بين الأزرار
// //       alignment: WrapAlignment.center,
// //       children: [
// //         _infoBadge('PG-13', isOutline: true),
// //         _infoBadge('2014', icon: Icons.calendar_month_outlined),
// //         _infoBadge('2h 49m', icon: Icons.schedule_outlined),
// //         _infoBadge('English', icon: Icons.translate_outlined),
// //       ],
// //     );
// //   }

// //   Widget _infoBadge(String text, {IconData? icon, bool isOutline = false}) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(
// //         horizontal: 10,
// //         vertical: 6,
// //       ), // تقليل الحشو (الملاحظة 4)
// //       decoration: BoxDecoration(
// //         color: isOutline ? Colors.transparent : AppColors.glassWhite10,
// //         borderRadius: BorderRadius.circular(8),
// //         border: Border.all(color: AppColors.glassBorder, width: 1.2),
// //       ),
// //       child: Row(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           if (icon != null) ...[
// //             Icon(icon, size: 14, color: AppColors.icon), // تصغير الأيقونة
// //             const SizedBox(width: 4),
// //           ],
// //           Text(
// //             text,
// //             style: AppTextStyles.movieInfoSemiBold.copyWith(
// //               color: Colors.white,
// //               fontSize: 11, // تصغير الخط قليلاً
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildCircleBtn(
// //     IconData icon, {
// //     Color color = Colors.white,
// //     VoidCallback? onTap,
// //   }) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: ClipRRect(
// //         borderRadius: BorderRadius.circular(50),
// //         child: BackdropFilter(
// //           filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
// //           child: Container(
// //             padding: const EdgeInsets.all(8), // تقليل حجم أزرار التحكم العلوية
// //             color: Colors.black.withOpacity(0.3),
// //             child: Icon(icon, color: color, size: 18), // أيقونات أصغر وأرشق
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/theme/app_text_styles.dart';

// class HeaderWidget extends StatefulWidget {
//   const HeaderWidget({super.key});

//   @override
//   State<HeaderWidget> createState() => _HeaderWidgetState();
// }

// class _HeaderWidgetState extends State<HeaderWidget> {
//   bool isFavorite = false;
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // 1. الخلفية المتدرجة العلوية
//         _buildBackground(),

//         // 2. المحتوى الأمامي
//         SafeArea(
//           child: Column(
//             children: [
//               const SizedBox(height: 10),
//               _buildTopActionButtons(),
//               const SizedBox(height: 15),
//               _buildInteractivePoster(),
//               const SizedBox(height: 20),
//               Text('Interstellar', style: AppTextStyles.movieTitleLarge),
//               const SizedBox(height: 4),
//               Text(
//                 'Sci-Fi • Adventure • Drama',
//                 style: AppTextStyles.movieInfoSemiBold.copyWith(
//                   color: Colors.white.withOpacity(0.7),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               _buildMovieInfoBadges(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildBackground() {
//     return Container(
//       height: 450,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/The Creator.jpg'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.black.withOpacity(0.3),
//               AppColors.background.withOpacity(0.8),
//               AppColors.background,
//             ],
//             stops: const [0.0, 0.7, 1.0],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTopActionButtons() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildCircleBtn(
//             Icons.arrow_back_ios_new,
//             onTap: () => Navigator.pop(context),
//           ),
//           Row(
//             children: [
//               _buildCircleBtn(Icons.share_outlined, onTap: () {}),
//               const SizedBox(width: 12),
//               _buildCircleBtn(
//                 isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: isFavorite ? Colors.red : Colors.white,
//                 onTap: () => setState(() => isFavorite = !isFavorite),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInteractivePoster() {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       child: GestureDetector(
//         onTap: () => print("Play Trailer"),
//         child: AnimatedScale(
//           scale: isHovered ? 1.05 : 1.0, // تكبير الصورة
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOutCubic,
//           child: Container(
//             width: 170,
//             height: 250,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               // تم إزالة الـ BoxShadow البنفسجي من هنا تماماً
//               image: const DecorationImage(
//                 image: AssetImage('assets/images/The Creator.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 // اللون الأبيض الشفاف يعطي مظهر "باهت ومضيء من الداخل" عند الـ Hover
//                 color: isHovered
//                     ? Colors.white.withOpacity(0.15)
//                     : Colors.transparent,
//               ),
//               child: AnimatedOpacity(
//                 duration: const Duration(milliseconds: 300),
//                 opacity: isHovered ? 1.0 : 0.0,
//                 child: Center(
//                   child: ClipOval(
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//                       child: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.2),
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: Colors.white.withOpacity(0.4),
//                           ),
//                         ),
//                         child: const Icon(
//                           Icons.play_arrow_rounded,
//                           size: 45,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMovieInfoBadges() {
//     return Wrap(
//       spacing: 8,
//       alignment: WrapAlignment.center,
//       children: [
//         _infoBadge('PG-13', isOutline: true),
//         _infoBadge('2014', icon: Icons.calendar_month_outlined),
//         _infoBadge('2h 49m', icon: Icons.schedule_outlined),
//         _infoBadge('English', icon: Icons.translate_outlined),
//       ],
//     );
//   }

//   Widget _infoBadge(String text, {IconData? icon, bool isOutline = false}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         color: isOutline ? Colors.transparent : AppColors.glassWhite10,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: AppColors.glassBorder, width: 1.2),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (icon != null) ...[
//             Icon(icon, size: 14, color: AppColors.icon),
//             const SizedBox(width: 4),
//           ],
//           Text(
//             text,
//             style: AppTextStyles.movieInfoSemiBold.copyWith(
//               color: Colors.white,
//               fontSize: 11,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCircleBtn(
//     IconData icon, {
//     Color color = Colors.white,
//     VoidCallback? onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(50),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
//           child: Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.black.withOpacity(0.3),
//             child: Icon(icon, color: color, size: 18),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool isFavorite = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. الخلفية المتدرجة العلوية (Backdrop)
        _buildBackground(),

        // 2. المحتوى الأمامي
        SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildTopActionButtons(),
              const SizedBox(height: 15),
              _buildInteractivePoster(),
              const SizedBox(height: 20),
              Text('Interstellar', style: AppTextStyles.movieTitleLarge),
              const SizedBox(height: 4),
              Text(
                'Sci-Fi • Adventure • Drama',
                style: AppTextStyles.movieInfoSemiBold.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 15),
              _buildMovieInfoBadges(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/The Creator.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              AppColors.background.withOpacity(0.8),
              AppColors.background,
            ],
            stops: const [0.0, 0.7, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildTopActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircleBtn(
            Icons.arrow_back_ios_new,
            onTap: () => Navigator.pop(context),
          ),
          Row(
            children: [
              _buildCircleBtn(Icons.share_outlined, onTap: () {}),
              const SizedBox(width: 12),
              _buildCircleBtn(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                onTap: () => setState(() => isFavorite = !isFavorite),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- القسم المعدل لحل مشكلة الإضاءة والتعتيم ---
  Widget _buildInteractivePoster() {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => print("Play Trailer"),
        child: AnimatedScale(
          scale: isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          child: Container(
            width: 170,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/The Creator.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(isHovered ? 0.4 : 0.1),
                  blurRadius: isHovered ? 30 : 10,
                  spreadRadius: isHovered ? 2 : -2,
                ),
              ],
            ),
            // نستخدم هذا الـ Container لعمل طبقة التعتيم/الإضاءة فوق الصورة
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // عند الـ Hover يصبح معتم (أسود خفيف)، بدونه يكون مضيء خفيف (أبيض شفاف)
                color: isHovered
                    ? Colors.black.withOpacity(0.4)
                    : Colors.white.withOpacity(0.1),
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isHovered ? 1.0 : 0.0,
                child: Center(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfoBadges() {
    return Wrap(
      spacing: 8,
      alignment: WrapAlignment.center,
      children: [
        _infoBadge('PG-13', isOutline: true),
        _infoBadge('2014', icon: Icons.calendar_month_outlined),
        _infoBadge('2h 49m', icon: Icons.schedule_outlined),
        _infoBadge('English', icon: Icons.translate_outlined),
      ],
    );
  }

  Widget _infoBadge(String text, {IconData? icon, bool isOutline = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isOutline ? Colors.transparent : AppColors.glassWhite10,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.glassBorder, width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: AppColors.icon),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: AppTextStyles.movieInfoSemiBold.copyWith(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleBtn(
    IconData icon, {
    Color color = Colors.white,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black.withOpacity(0.3),
            child: Icon(icon, color: color, size: 18),
          ),
        ),
      ),
    );
  }
}
