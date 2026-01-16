import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/view/review_screen.dart';
import 'package:flutter_graduation_project/features/reviews/logic/review_cubit.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class MovieReviewsHeaderSection extends StatelessWidget {
  final int movieId;
  final String movieTitle;
  final String moviePoster;
  final String movieInfo;

  const MovieReviewsHeaderSection({
    super.key,
    required this.movieId,
    required this.movieTitle,
    required this.moviePoster,
    required this.movieInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Reviews(12K)",
            style: AppTextStyles.sectionTitle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),

          Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<ReviewCubit>(),
                        child: ReviewScreen(
                          movieId: movieId,
                          movieTitle: movieTitle,
                          moviePoster: moviePoster,
                          movieInfo: movieInfo,
                        ),
                      ),
                    ),
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.rate_review,
                        size: 22,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),

                      Text(
                        "Post Review",
                        style: AppTextStyles.button.copyWith(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
