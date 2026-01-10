import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_action_rating_buttons.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_cast_section.dart.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_header_widget.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_reviews_widget.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_rating_section.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_synopsis_section.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_reviews_header_section.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/other_reviews_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            const SizedBox(height: 10),
            ActionRatingSection(),
            const SizedBox(height: 20),
            MovieRatingSection(),
            const SizedBox(height: 20),
            MovieSynopsisSection(),
            const SizedBox(height: 20),
            SynopsisCastSection(),
            const SizedBox(height: 30),
            MovieReviewsHeaderSection(),
            const SizedBox(height: 20),
            ReviewsSection(),
            const SizedBox(height: 20),
            OtherReviewsSection(),
          ],
        ),
      ),
    );
  }
}
