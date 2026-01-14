import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter_graduation_project/core/navigation/navigation_manager.dart';
import 'package:flutter_graduation_project/core/theme/app_theme.dart';
import 'package:flutter_graduation_project/features/Splash/ui/view/splash_screen.dart';

// API
import 'core/api/dio_consumer.dart';

// Auth
import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/logic/auth_cubit.dart';

// Movies
import 'features/movies/data/datasource/movie_remote_data_source.dart';
import 'features/movies/data/repository/movie_repository.dart';
import 'features/movies/logic/movie_cubit.dart';
import 'features/movies/logic/movie_details_cubit.dart';

void main() {
  final dio = Dio();
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

  runApp(
    MyApp(
      authRepository: authRepository,
      movieRepository: movieRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;
  final MovieRepository movieRepository;

  const MyApp({
    super.key,
    required this.authRepository,
    required this.movieRepository,
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
