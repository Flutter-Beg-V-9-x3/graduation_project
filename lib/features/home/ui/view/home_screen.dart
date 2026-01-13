import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/Discover_section.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/category_chips_widget.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/for_you_section.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/search_bar_widget.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/trending_section.dart';
import 'package:flutter_graduation_project/features/movies/logic/movie_cubit.dart';
import 'package:flutter_graduation_project/features/movies/data/repository/movie_repository.dart';
import 'package:flutter_graduation_project/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_graduation_project/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // إنشاء المثيلات المطلوبة لـ MovieCubit
    final dio = Dio();
    final dioConsumer = DioConsumer(dio: dio);
    final remoteDataSource = MovieRemoteDataSourceImpl(
      apiConsumer: dioConsumer,
    );
    final movieRepository = MovieRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );

    return BlocProvider(
      create: (context) {
        final cubit = MovieCubit(movieRepository: movieRepository);
        cubit.fetchMovies();
        return cubit;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                const TrendingSection(),
                const SizedBox(height: 24),
                const ForYouSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
