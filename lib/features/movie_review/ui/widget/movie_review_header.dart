import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/rating_section.dart';



class ReviewHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onCancel;

  const ReviewHeader({
    super.key,
    required this.onBack,
    required this.onCancel,
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
            // --------------------------------------------------
            // 1) BACKGROUND + BRIGHTNESS + BLUR + GRADIENT
            // --------------------------------------------------
            Positioned.fill(
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), // brightness-50
                      BlendMode.darken,
                    ),
                    child: Image.asset(
                      'assets/images/unnamed.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Blur
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(color: Colors.transparent),
                    ),
                  ),

                  // Gradient 
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

            // --------------------------------------------------
            // 2) FOREGROUND CONTENT
            // --------------------------------------------------
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    // HEADER ROW
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onBack,
                          child: Row(
                            children: const [
                              Icon(Icons.arrow_back),
                              SizedBox(width: 6),
                              Text(
                                "Cancel",
                                style: AppTextStyles.caption
                              ),
                            ],
                          ),
                        ),

                        const Text(
                          "Write Review",
                          style: AppTextStyles.movieTitle
                        ),

                        const SizedBox(width: 40),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // MOVIE INFO CONTAINER
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withOpacity(0.05)),
                      ),
                      child: Row(
                        children: [
                          // Movie poster
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/1.png',
                              width: 65,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 14),

                          // Movie info
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Interstellar",
                                style: AppTextStyles.movieTitle
                              ),
                              SizedBox(height: 4),
                              Text(
                                "2014 • Sci-Fi • Drama",
                                style: AppTextStyles.movieInfo
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // RATING SECTION
                    const RatingSection(),

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