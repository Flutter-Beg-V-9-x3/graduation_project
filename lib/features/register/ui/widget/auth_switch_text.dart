import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class AuthSwitchText extends StatelessWidget {
  final String normalText;
  final String buttonText;
  final VoidCallback onPressed;

  const AuthSwitchText({
    super.key,
    required this.normalText,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalText,
          style: AppTextStyles.reviewDate
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppTextStyles.link,
          ),
        ),
      ],
    );
  }
}