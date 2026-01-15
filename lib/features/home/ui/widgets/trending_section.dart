import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/navigation/navigation_manager.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/view/movie_details_screen.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_model.dart';

class TrendingSection extends StatelessWidget {
  final List<MovieModel> movies;

  const TrendingSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // العنوان + See all
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 16 : 24,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending Now",
                style: AppTextStyles.title.copyWith(
                  fontSize: isSmallScreen ? 20 : 24,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: TextStyle(
                    color: const Color(0xFF7F13EC),
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                ),
              ),
            ],
          ),
        ),

        // القائمة الأفقية responsive
        SizedBox(
          height: screenWidth * 0.75, // نسبة من العرض (تتكيف تلقائيًا)
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: isSmallScreen ? 16 : 24),
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return TrendingMovieCard(movie: movies[index]);
            },
          ),
        ),
      ],
    );
  }
}

class TrendingMovieCard extends StatelessWidget {
  final MovieModel movie;

  const TrendingMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return LayoutBuilder(
      builder: (context, constraints) {
        // عرض الكارد نسبي (حوالي 40-45% من عرض الشاشة)
        final cardWidth = screenWidth * (isSmallScreen ? 0.45 : 0.38);

        return GestureDetector(
          onTap: () {
            NavigationManager.push(MovieDetailsScreen(movieId: movie.id));
          },
          child: SizedBox(
            width: cardWidth,
            child: Padding(
              padding: EdgeInsets.only(right: isSmallScreen ? 12 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // البوستر مع AspectRatio للحفاظ على النسبة
                  AspectRatio(
                    aspectRatio: 2 / 3, // نسبة البوستر القياسية
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            movie.posterUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Colors.grey[800],
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),

                          // نجمة التقييم في الزاوية
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "8.5",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // العنوان
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // النوع
                  Text(
                    movie.genreName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
