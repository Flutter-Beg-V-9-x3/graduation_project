import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/movies/logic/movie_cubit.dart';
import 'package:flutter_graduation_project/features/movies/logic/movie_state.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_model.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          final trendingMovies = state.movies.take(5).toList();
          return _TrendingContent(movies: trendingMovies);
        } else if (state is MovieError) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                "Error: ${state.message}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        } else if (state is MovieLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _TrendingContent extends StatelessWidget {
  final List<MovieModel> movies;

  const _TrendingContent({required this.movies});

  @override
  Widget build(BuildContext context) {
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
                  letterSpacing: -0.5,
                ),
              ),
              _CustomSeeAllButton(onTap: () {}),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) =>
                _TrendingCard(movie: movies[index]),
          ),
        ),
      ],
    );
  }
}

class _TrendingCard extends StatelessWidget {
  final MovieModel movie;

  const _TrendingCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MoviePoster(rating: "8.5", imageUrl: movie.posterUrl),
          const SizedBox(height: 12),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            movie.genreName,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatefulWidget {
  final String rating;
  final String imageUrl;

  const _MoviePoster({required this.rating, required this.imageUrl});

  @override
  State<_MoviePoster> createState() => _MoviePosterState();
}

class _MoviePosterState extends State<_MoviePoster> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -10, 0))
            : Matrix4.identity(),
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? const Color(0xFF7F13EC).withOpacity(0.4)
                      : Colors.black26,
                  blurRadius: 12,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Center(
                            child: Icon(Icons.movie, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: _RatingBadge(rating: widget.rating),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final String rating;
  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          color: Colors.black.withOpacity(0.5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
              const SizedBox(width: 4),
              Text(
                rating,
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
    );
  }
}

class _CustomSeeAllButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CustomSeeAllButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: const Text(
        "See all",
        style: TextStyle(color: Color(0xFF7F13EC), fontWeight: FontWeight.bold),
      ),
    );
  }
}
