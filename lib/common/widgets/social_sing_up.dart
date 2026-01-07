import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSignUpButtons extends StatelessWidget {
  const SocialSignUpButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff302839),

              side: BorderSide(
                color: Colors.white.withOpacity(0.3),
                width: 0.5,
              ),
              minimumSize: const Size.fromHeight(55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
            label: const Text("Google", style: AppTextStyles.button),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff302839),
              side: BorderSide(
                color: Colors.white.withOpacity(0.3),
                width: 0.5,
              ),
              minimumSize: const Size.fromHeight(55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.white),
            label: const Text("Apple", style: AppTextStyles.button),
          ),
        ),
      ],
    );
  }
}
