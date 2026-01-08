import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class welcome_back extends StatelessWidget {
  const welcome_back({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Welcome Back', style: AppTextStyles.title)],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log in to track and rate the latest premieres.',
              style: AppTextStyles.body,
            ),
          ],
        ),
      ],
    );
  }
}