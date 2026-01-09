import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OtherReviewItem extends StatelessWidget {
  final String initials;
  final String name;
  final String timeAgo;
  final String reviewText;
  final int starCount;
  final Color circleColor;

  const OtherReviewItem({
    super.key,
    required this.initials,
    required this.name,
    required this.timeAgo,
    required this.reviewText,
    this.starCount = 5,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: circleColor.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(color: circleColor.withOpacity(0.4)),
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: AppTextStyles.labelSemiBold.copyWith(
                color: circleColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.reviewUsername.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Row(
                      children: List.generate(
                        starCount,
                        (index) => const Icon(
                          Icons.star_rounded,
                          color: AppColors.primary,
                          size: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    Text(
                      timeAgo,
                      style: AppTextStyles.reviewDate.copyWith(fontSize: 12),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  reviewText,
                  style: AppTextStyles.reviewContent.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
