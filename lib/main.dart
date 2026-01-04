import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_theme.dart';

import 'package:flutter_graduation_project/features/home/ui/view/home_screen.dart';
import 'package:flutter_graduation_project/features/home/ui/view/movie_details_screen.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/movie_header_widget.dart';

import 'package:flutter_graduation_project/features/home/ui/widgets/movie_reviews_widget.dart';

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
