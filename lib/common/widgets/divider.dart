import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({this.text = "Or continue with", super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 0.5, color: Colors.grey.shade400)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(text, style: AppTextStyles.caption),
        ),
        Expanded(child: Divider(thickness: 0.5, color: Colors.grey.shade400)),
      ],
    );
  }
}
