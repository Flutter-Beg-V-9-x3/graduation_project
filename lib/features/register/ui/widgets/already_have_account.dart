import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final VoidCallback onTapLogin;

  const AlreadyHaveAccount({Key? key, required this.onTapLogin})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ', style: AppTextStyles.caption),
        GestureDetector(
          onTap: onTapLogin,
          child: Text('Log in', style: AppTextStyles.ratingValue.copyWith()),
        ),
      ],
    );
  }
}
