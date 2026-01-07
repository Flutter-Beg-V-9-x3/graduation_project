// import 'package:flutter/material.dart';
// import 'package:flutter_graduation_project/features/home/ui/widgets/movie_header_widget.dart';
// import 'app_colors.dart';
// // استورد الملفات الأربعة هنا

// class MovieDetailsScreen extends StatelessWidget {
//   const MovieDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SingleChildScrollView(
//         padding: EdgeInsets.zero,
//         child: Column(
//           children: [
//             const MovieHeader(),           // القسم 1
//             const SizedBox(height: 10),
//             const MovieActionsAndRating(), // القسم 2
//             const SizedBox(height: 30),
//             const MovieSynopsisAndCast(),  // القسم 3
//             const SizedBox(height: 30),
//             const MovieReviews(),          // القسم 4
//             const SizedBox(height: 50),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/movie_action_rating_buttons.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/movie_cast_section.dart.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/movie_header_widget.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/movie_reviews_widget.dart';
// استدعاء ملفات الودجتات الفرعية هنا

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(), // القسم 1
            const SizedBox(height: 10),
            ActionRatingSection(), // القسم 2
            const SizedBox(height: 20),
            SynopsisCastSection(), // القسم 3
            const SizedBox(height: 30),
            ReviewsSection(), // القسم 4
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
