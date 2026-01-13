import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/movies/logic/movie_cubit.dart';
import 'package:flutter_graduation_project/features/movies/logic/movie_state.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_model.dart';

class ForYouSection extends StatelessWidget {
  const ForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          final forYouMovies = state.movies.take(4).toList();
          return _ForYouContent(movies: forYouMovies);
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

class _ForYouContent extends StatelessWidget {
  final List<MovieModel> movies;

  const _ForYouContent({required this.movies});

  @override
  Widget build(BuildContext context) {
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
        GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 20,
          childAspectRatio: 0.68,
          children: List.generate(movies.length, (index) {
            final movie = movies[index];
            return _PosterCard(movie: movie, index: index);
          }),
        ),
      ],
    );
  }
}

class _PosterCard extends StatefulWidget {
  final MovieModel movie;
  final int index;

  const _PosterCard({required this.movie, required this.index});

  @override
  State<_PosterCard> createState() => _PosterCardState();
}

class _PosterCardState extends State<_PosterCard> {
  bool _isHovered = false;

  String get _fixedRating {
    switch (widget.index) {
      case 0:
        return "8.8";
      case 1:
        return "7.6";
      case 2:
        return "8.4";
      case 3:
        return "6.9";
      default:
        return "8.0";
    }
  }

  String? get _badgeText {
    switch (widget.index) {
      case 0:
        return "98% Match";
      case 3:
        return "New";
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            cursor: SystemMouseCursors.click,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  AnimatedScale(
                    scale: _isHovered ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: Image.network(
                      widget.movie.posterUrl,
                      width: double.infinity,
                      height: double.infinity,
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

                  AnimatedOpacity(
                    opacity: _isHovered ? 0.0 : 0.6,
                    duration: const Duration(milliseconds: 300),
                    child: Container(color: Colors.black),
                  ),

                  AnimatedOpacity(
                    opacity: _isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.transparent,
                          ],
                          radius: 0.7,
                        ),
                      ),
                    ),
                  ),

                  if (_badgeText != null)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7F13EC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _badgeText!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.movie.title,
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
            const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
            const SizedBox(width: 4),
            Text(
              _fixedRating,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            Text("•", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            const SizedBox(width: 6),
            Text(
              widget.movie.year.toString(),
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
