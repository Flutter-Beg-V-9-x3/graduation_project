import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_graduation_project/core/theme/app_theme.dart';
import 'package:flutter_graduation_project/features/Splash/ui/view/splash_screen.dart';
import 'core/api/dio_consumer.dart';
import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/logic/auth_cubit.dart';

void main() {
  // 1)  Dio
  final dio = Dio();

  // 2)  ApiConsumer
  final apiConsumer = DioConsumer(dio: dio);

  // 3)  RemoteDataSource
  final authRemoteDataSource = AuthRemoteDataSourceImpl(api: apiConsumer);

  // 4)  Repository
  final authRepository = AuthRepositoryImpl(
    remoteDataSource: authRemoteDataSource,
  );

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // 5) AuthCubit
        BlocProvider(create: (_) => AuthCubit(authRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: SplashScreen(),
      ),
    );
  }
}