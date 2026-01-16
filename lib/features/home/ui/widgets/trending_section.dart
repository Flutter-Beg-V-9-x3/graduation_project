import 'package:flutter/gestures.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;

    final isSmallScreen = screenWidth < 600;

    final sectionHeight = (screenHeight * 0.35).clamp(320.0, 560.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  fontSize: isSmallScreen ? 20 : 26,
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

        SizedBox(
          height: sectionHeight,
          child: ScrollConfiguration(
            behavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 16 : 24,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return TrendingMovieCard(movie: movies[index]);
              },
            ),
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

    final cardWidth = (screenWidth * (isSmallScreen ? 0.45 : 0.30)).clamp(
      160.0,
      320.0,
    );

    return SizedBox(
      width: cardWidth,
      child: GestureDetector(
        onTap: () {
          NavigationManager.push(MovieDetailsScreen(movieId: movie.id));
        },
        child: Padding(
          padding: EdgeInsets.only(right: isSmallScreen ? 12 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:
                MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 2 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        movie.posterUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey[850],
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.white70,
                            size: 48,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.65),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_border,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "8.5",
                                style:
                                    AppTextStyles.buttonSmallSemiBold?.copyWith(
                                      fontSize: 13,
                                    ) ??
                                    const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
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

              Text(
                movie.title,
                maxLines: 1, 
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.movieTitle,
              ),

              const SizedBox(height: 4),

              Text(
                movie.genreName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.movieInfo,
              ),

            ],
          ),
        ),
      ),
    );
  }
}