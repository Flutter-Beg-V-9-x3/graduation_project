import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xffbb86fc), width: 4),
          ),
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/2.png'),
            backgroundColor: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Text(name, style: AppTextStyles.title),
        const SizedBox(height: 8),
        Text(email, style: AppTextStyles.labelUppercase),
      ],
    );
  }
}
