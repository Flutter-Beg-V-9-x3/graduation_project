import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعاء ستايل titleLarge من الثيم
    final TextStyle? titleLargeStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.glassWhite5,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "AVERAGE RATING",
                  style: AppTextStyles.labelUppercase,
                ),
                Row(
                  children: [
                    Text("8.6", style: AppTextStyles.ratingLarge),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, color: AppColors.primary, size: 24),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 40, width: 1, color: AppColors.divider),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "ROTTEN TOMATOES",
                  style: AppTextStyles.labelUppercase,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.local_activity,
                      color: AppColors.error,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    // استخدام الستايل من الثيم هنا
                    Text("73%", style: titleLargeStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
