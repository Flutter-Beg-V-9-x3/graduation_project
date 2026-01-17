import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/movies/Presentation/ui/widgets/Discover_section.dart';
import 'package:flutter_graduation_project/features/movies/Presentation/ui/widgets/category_chips_widget.dart';
import 'package:flutter_graduation_project/features/movies/Presentation/ui/widgets/search_bar_widget.dart';
import 'package:flutter_graduation_project/features/movies/Presentation/ui/widgets/trending_section.dart';
import 'package:flutter_graduation_project/features/movies/Presentation/ui/widgets/for_you_section.dart';
import 'package:flutter_graduation_project/features/movies/Presentation/cubit/movie_cubit.dart';
import 'package:flutter_graduation_project/features/movies/Presentation/cubit/movie_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            if (state is MovieError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state is MoviesLoaded) {
              final movies = state.movies;

              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DiscoverWidget(),
                    const SizedBox(height: 10),
                    const HomeSearchBar(),
                    const SizedBox(height: 20),
                    const CategoryChips(),
                    const SizedBox(height: 24),

                    TrendingSection(movies: movies),
                    const SizedBox(height: 24),

                    ForYouSection(movies: movies),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
