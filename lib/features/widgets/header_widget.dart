import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Welcome back", style: AppTextStyles.caption),
            SizedBox(height: 4),
            Text("Discover", style: AppTextStyles.title),
          ],
        ),
        const CircleAvatar(),
      ],
    );
  }
}
