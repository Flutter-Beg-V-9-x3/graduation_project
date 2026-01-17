import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';

// Widgets
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_action_rating_buttons.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_cast_section.dart.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_header_widget.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_rating_section.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_synopsis_section.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_reviews_header_section.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/reviews_section.dart';

// Cubit
import 'package:flutter_graduation_project/features/movies/logic/movie_details_cubit.dart';
import 'package:flutter_graduation_project/features/movies/logic/movie_details_state.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsCubit>().fetchMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          if (state is MovieDetailsError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          if (state is MovieDetailsLoaded) {
            final movie = state.movie;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER (Poster + Title + Genres + Badges)
                  HeaderWidget(movie: movie),

                  const SizedBox(height: 10),

                  /// Action Buttons (Watchlist, Like, Share)
                  ActionRatingSection(movie: movie),

                  const SizedBox(height: 20),

                  /// Rating Section (Stars + Score)
                  MovieRatingSection(movie: movie),

                  const SizedBox(height: 20),

                  /// Synopsis
                  MovieSynopsisSection(movie: movie),

                  const SizedBox(height: 20),

                  /// Cast Section
                  SynopsisCastSection(movie: movie),

                  const SizedBox(height: 30),

                  /// Reviews Header (Title + Add Review Button)
                  MovieReviewsHeaderSection(
                    movieId: movie.id,
                    movieTitle: movie.title,
                    moviePoster: movie.posterUrl,
                    movieInfo: "${movie.year} • ${movie.genreName ?? ''}",
                  ),

                  const SizedBox(height: 20),

                  /// Reviews Section (User Review + Other Reviews)
                  ReviewsSection(movie: movie),

                  const SizedBox(height: 40),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
