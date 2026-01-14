import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/navigation/navigation_manager.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/view/movie_details_screen.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_model.dart';

class TrendingSection extends StatelessWidget {
  final List<MovieModel> movies;

  const TrendingSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Trending Now",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(
                    color: Color(0xFF7F13EC),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // ------------------ Responsive List ------------------
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = MediaQuery.of(context).size.width * 0.38;

        return GestureDetector(
          onTap: () {
            NavigationManager.push(
              MovieDetailsScreen(movieId: movie.id),
            );
          },
          child: Container(
            width: cardWidth,
            margin: const EdgeInsets.only(right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ------------------ POSTER ------------------
                AspectRatio(
                  aspectRatio: 2 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            movie.posterUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Colors.grey[800],
                              child: const Icon(Icons.broken_image, color: Colors.white),
                            ),
                          ),
                        ),

                        // star
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.star_border, color: Colors.amber, size: 14),
                                SizedBox(width: 4),
                                Text(
                                  "8.5",
                                  style: TextStyle(
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

                // ------------------ TITLE ------------------
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

                // ------------------ GENRE ------------------
                Text(
                  movie.genreName,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
