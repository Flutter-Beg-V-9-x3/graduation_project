import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class ReviewCard extends StatelessWidget {
  final bool isUserReview;
  const ReviewCard({super.key, required this.isUserReview});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUserReview ? AppColors.glassPrimary10 : AppColors.glassWhite5,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUserReview
              ? AppColors.borderPrimary30
              : AppColors.glassBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: isUserReview
                        ? AppColors.primary
                        : AppColors.glassWhite10,
                    child: Text(
                      isUserReview ? "You" : "JD",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isUserReview ? "Your Review" : "John Doe",
                        style: AppTextStyles.reviewUsername,
                      ),
                      Text("Oct 24, 2023", style: AppTextStyles.reviewDate),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.more_horiz, color: AppColors.icon),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "Absolutely mind-blowing visuals and a soundtrack that stays with you for days...",
            style: AppTextStyles.reviewContent,
          ),
        ],
      ),
    );
  }
}
