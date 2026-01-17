import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_graduation_project/core/api/interceptors/logging_interceptor.dart';
import 'package:flutter_graduation_project/core/api/interceptors/token_interceptor.dart';

import 'package:flutter_graduation_project/core/navigation/navigation_manager.dart';
import 'package:flutter_graduation_project/core/theme/app_theme.dart';
import 'package:flutter_graduation_project/features/Splash/view/splash_screen.dart';

// API
import 'core/api/dio_consumer.dart';

// Auth
import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/Presentation/cubit/auth_cubit.dart';

// Movies
import 'features/movies/data/datasource/movie_remote_data_source.dart';
import 'features/movies/data/repository/movie_repository.dart';
import 'features/movies/Presentation/cubit/movie_cubit.dart';
import 'features/movies/Presentation/cubit/movie_details_cubit.dart';

// Reviews
import 'features/reviews/data/datasource/review_remote_data_source.dart';
import 'features/reviews/data/repository/review_repository.dart';
import 'features/reviews/Presentation/cubit/review_cubit.dart';

void main() {
  final dio = Dio();

  // Interceptors
  dio.interceptors.add(LoggingInterceptor());
  dio.interceptors.add(TokenInterceptor());

  final apiConsumer = DioConsumer(dio: dio);

  // -------------------------
  // Auth Dependencies
  // -------------------------
  final authRemoteDataSource = AuthRemoteDataSourceImpl(api: apiConsumer);
  final authRepository = AuthRepositoryImpl(remoteDataSource: authRemoteDataSource);

  // -------------------------
  // Movies Dependencies
  // -------------------------
  final movieRemoteDataSource = MovieRemoteDataSourceImpl(apiConsumer);
  final movieRepository = MovieRepository(movieRemoteDataSource);

  // -------------------------
  // Reviews Dependencies
  // -------------------------
  final reviewRemoteDataSource = ReviewRemoteDataSourceImpl(apiConsumer);
  final reviewRepository = ReviewRepository(reviewRemoteDataSource);

  runApp(
    MyApp(
      authRepository: authRepository,
      movieRepository: movieRepository,
      reviewRepository: reviewRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;
  final MovieRepository movieRepository;
  final ReviewRepository reviewRepository;

  const MyApp({
    super.key,
    required this.authRepository,
    required this.movieRepository,
    required this.reviewRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Auth
        BlocProvider(create: (_) => AuthCubit(authRepository)),

        // Movies List
        BlocProvider(create: (_) => MovieCubit(movieRepository)..fetchMovies()),

        // Movie Details
        BlocProvider(create: (_) => MovieDetailsCubit(movieRepository)),

        // Reviews
        BlocProvider(create: (_) => ReviewCubit(reviewRepository)),
      ],
      child: MaterialApp(
        navigatorKey: NavigationManager.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: SplashScreen(),
      ),
    );
  }
}
