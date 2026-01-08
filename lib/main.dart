import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_theme.dart';
import 'package:flutter_graduation_project/features/login/ui/view/login_screen.dart';
import 'package:flutter_graduation_project/features/register/ui/view/register_screen.dart';

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
      home: RegisterScreen(),
    );
  }
}
