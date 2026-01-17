import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Welcome Back',
          style: AppTextStyles.title,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12),
        Text(
          'Log in to track and rate the latest premieres.',
          style: AppTextStyles.body,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
