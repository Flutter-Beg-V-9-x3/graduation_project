import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/reviews/data/models/review_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OtherReviewItem extends StatelessWidget {
  final ReviewModel review;

  const OtherReviewItem({super.key, required this.review});

  String _getInitials(String name) {
    final parts = name.trim().split(" ");
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final initials = _getInitials(review.user.name);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withOpacity(0.4)),
                ),
                alignment: Alignment.center,
                child: Text(
                  initials,
                  style: AppTextStyles.labelSemiBold.copyWith(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Username + Stars + Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.user.name,
                      style: AppTextStyles.reviewUsername.copyWith(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: index < review.rating
                                  ? AppColors.primary
                                  : AppColors.icon,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Recently",
                          style: AppTextStyles.reviewDate.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Review Comment
          Text(
            review.comment,
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            style: AppTextStyles.reviewContent.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}
