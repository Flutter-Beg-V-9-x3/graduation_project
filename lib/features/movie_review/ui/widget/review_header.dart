import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/rating_section.dart';

class ReviewHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onCancel;
  final String movieTitle;
  final String moviePoster;
  final String movieInfo;
  final ValueChanged<int> onRatingSelected;

  const ReviewHeader({
    super.key,
    required this.onBack,
    required this.onCancel,
    required this.movieTitle,
    required this.moviePoster,
    required this.movieInfo,
    required this.onRatingSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double headerHeight = MediaQuery.of(context).size.height * 0.40;

    return ClipRect(
      child: SizedBox(
        height: headerHeight,
        width: double.infinity,
        child: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    child: Image.asset(
                      'assets/images/unnamed.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(color: Colors.transparent),
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            const Color(0xFF0c0810).withOpacity(0.8),
                            const Color(0xFF0c0810),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Foreground
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onBack,
                          child: Row(
                            children: const [
                              Icon(Icons.arrow_back),
                              SizedBox(width: 6),
                              Text("Cancel", style: AppTextStyles.caption),
                            ],
                          ),
                        ),

                        const Text(
                          "Write Review",
                          style: AppTextStyles.movieTitle,
                        ),

                        const SizedBox(width: 40),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Movie Info
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.05),
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              moviePoster,
                              width: 65,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movieTitle, style: AppTextStyles.movieTitle),
                              const SizedBox(height: 4),
                              Text(movieInfo, style: AppTextStyles.movieInfo),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    RatingSection(onRatingSelected: onRatingSelected),

                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
