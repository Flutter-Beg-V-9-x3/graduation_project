import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';

// Widgets
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_action_rating_buttons.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_cast_section.dart.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_header_widget.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_reviews_widget.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_rating_section.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_synopsis_section.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/movie_reviews_header_section.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/other_reviews_section.dart';

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

                  ActionRatingSection(movie: movie),

                  const SizedBox(height: 20),

                  MovieRatingSection(movie: movie),

                  const SizedBox(height: 20),

                  MovieSynopsisSection(movie: movie),

                  const SizedBox(height: 20),

                  SynopsisCastSection(movie: movie),

                  const SizedBox(height: 30),

                  MovieReviewsHeaderSection(),

                  const SizedBox(height: 20),

                  ReviewsSection(movie: movie),

                  const SizedBox(height: 20),

                  OtherReviewsSection(movie: movie),

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
