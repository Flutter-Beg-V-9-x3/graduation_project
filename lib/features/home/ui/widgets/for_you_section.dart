import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/navigation/navigation_manager.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/view/movie_details_screen.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_model.dart';

class ForYouSection extends StatelessWidget {
  final List<MovieModel> movies;

  const ForYouSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "For You",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 14),

        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
            childAspectRatio: 0.60,
          ),
          itemBuilder: (context, index) {
            return MoviePosterCard(movie: movies[index]);
          },
        ),
      ],
    );
  }
}

class MoviePosterCard extends StatelessWidget {
  final MovieModel movie;

  const MoviePosterCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationManager.push(MovieDetailsScreen(movieId: movie.id));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 150 / 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                movie.posterUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[800],
                  child: const Icon(Icons.broken_image, color: Colors.white),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

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

          Row(
            children: [
              const Icon(Icons.star_border, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                "8.5",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "•",
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              const SizedBox(width: 6),
              Text(
                movie.year.toString(),
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
