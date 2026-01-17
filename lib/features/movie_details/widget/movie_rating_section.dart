import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class MovieRatingSection extends StatelessWidget {
  const MovieRatingSection({super.key, required  MovieDetailsModel movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: _buildAverageRating()),

            Container(width: 1, height: 60, color: AppColors.divider),

            Expanded(child: _buildRottenTomatoes()),
          ],
        ),
      ),
    );
  }

  Widget _buildAverageRating() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "AVERAGE RATING",
          style: AppTextStyles.labelUppercase
        ),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "8.6",
              style: AppTextStyles.ratingLarge.copyWith(
                fontSize: 24,
                color: Colors.white,
                height: 1,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 8),

            Row(
              children: [
                _buildStar(filled: true),
                const SizedBox(width: 1),
                _buildStar(filled: true),
                const SizedBox(width: 1),
                _buildStar(filled: true),
                const SizedBox(width: 1),
                _buildStar(filled: true),
                const SizedBox(width: 1),
                _buildPartialStar(fillPercentage: 0.6),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStar({bool filled = true}) {
    return Icon(
      Icons.star_rounded,
      color: filled ? AppColors.primary : AppColors.ratingStarEmpty,
      size: 20,
    );
  }

  Widget _buildPartialStar({required double fillPercentage}) {
    return Stack(
      children: [
        Icon(Icons.star_rounded, color: AppColors.ratingStarEmpty, size: 20),
        ClipRect(
          clipper: _StarClipper(fillPercentage: fillPercentage),
          child: Icon(Icons.star_rounded, color: AppColors.primary, size: 20),
        ),
      ],
    );
  }

  Widget _buildRottenTomatoes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ROTTEN TOMATOES",
          style: AppTextStyles.labelUppercase
        ),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.local_activity, color: AppColors.error, size: 24),
            const SizedBox(width: 8),

            Text(
              "73%",
              style: AppTextStyles.ratingLarge.copyWith(
                fontSize: 24,
                color: Colors.white,
                height: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillPercentage;

  _StarClipper({required this.fillPercentage});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * fillPercentage, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
