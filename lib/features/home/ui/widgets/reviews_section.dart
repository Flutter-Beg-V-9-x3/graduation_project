import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Reviews (12k)', style: AppTextStyles.sectionTitle),
            _buildPostReviewButton(),
          ],
        ),
        const SizedBox(height: 16),
        // كرت المراجعة الخاصة بالمستخدم
        const ReviewCard(
          isOwnReview: true,
          username: 'Your Review',
          content:
              'Absolutely mind-blowing visuals and a soundtrack that stays with you for days...',
          date: 'Oct 24, 2023',
        ),
      ],
    );
  }

  Widget _buildPostReviewButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.glassPrimary20,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Icon(Icons.rate_review, size: 16, color: AppColors.primary),
          SizedBox(width: 6),
          Text('Post Review', style: AppTextStyles.buttonSmallSemiBold),
        ],
      ),
    );
  }
}

// ويدجيت الكرت استخرجناه لتجنب التكرار
class ReviewCard extends StatelessWidget {
  final bool isOwnReview;
  final String username;
  final String content;
  final String date;

  const ReviewCard({
    super.key,
    required this.isOwnReview,
    required this.username,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isOwnReview ? AppColors.glassPrimary10 : AppColors.glassWhite5,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isOwnReview ? AppColors.borderPrimary30 : AppColors.softBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username, style: AppTextStyles.reviewUsername),
          const SizedBox(height: 8),
          Text(content, style: AppTextStyles.reviewContent),
          if (isOwnReview) ...[
            const SizedBox(height: 12),
            const Divider(color: AppColors.softBorder),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildAction(Icons.edit, 'Edit'),
                const SizedBox(width: 16),
                _buildAction(Icons.delete, 'Delete', isDelete: true),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAction(IconData icon, String label, {bool isDelete = false}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: isDelete ? AppColors.textRed : Colors.white,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: isDelete ? AppColors.textRed : Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
