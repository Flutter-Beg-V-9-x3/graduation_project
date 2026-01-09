import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_theme.dart';
import 'package:flutter_graduation_project/features/home/home_screen.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/veiw/movie_details_screen.dart';
import 'package:flutter_graduation_project/features/movie_details_2/ui/view/movie_detalis_screen_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Beg',
      theme: AppTheme.theme,
      home: MovieDetailsScreen(),
    );
  }
}
