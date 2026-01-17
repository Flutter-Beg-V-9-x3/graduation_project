import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:material_symbols_icons/symbols.dart';

class CreateAccountSection extends StatelessWidget {
  const CreateAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xff7f13ec).withOpacity(0.3),
                blurRadius: 100,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xff2d134c),

            child: Icon(
              Symbols.movie_filter,
              size: 40,
              color: Color(0xff7f13ec),
            ),
          ),
        ),
        const SizedBox(height: 48),
        const Text('Create Account', style: AppTextStyles.title),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Start tracking your watchlist and reviewing movies today.',
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(color: Colors.grey[400]),
          ),
        ),
      ],
    );
  }
}
