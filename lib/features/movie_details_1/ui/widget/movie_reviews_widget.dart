import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ReviewItem extends StatelessWidget {
  final String username;
  final String date;
  final int rating;
  final String reviewText;
  final int likeCount;

  final VoidCallback? onLike;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  final bool isOwner;

  const ReviewItem({
    super.key,
    required this.username,
    required this.date,
    required this.rating,
    required this.reviewText,
    required this.likeCount,
    this.onLike,
    this.onEdit,
    this.onDelete,
    this.isOwner = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(username),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: AppTextStyles.reviewUsername.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildStars(rating),
                        const SizedBox(width: 8),
                        Text(
                          date,
                          style: AppTextStyles.reviewDate.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Icon(Icons.more_horiz, color: AppColors.textMuted, size: 22),
            ],
          ),

          const SizedBox(height: 16),

          // Review Content
          Text(
            reviewText,
            style: AppTextStyles.reviewContent.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.6,
            ),
          ),

          const SizedBox(height: 16),
          Divider(color: AppColors.primary.withOpacity(0.1), thickness: 1),
          const SizedBox(height: 12),

          // Action Buttons
          Row(
            children: [
              GestureDetector(
                onTap: onLike,
                child: Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined,
                        size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 6),
                    Text(
                      "$likeCount",
                      style: AppTextStyles.captionSmall.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              if (isOwner) ...[
                _buildSmallActionButton(
                  label: "Edit",
                  icon: Icons.edit_outlined,
                  color: Colors.white.withOpacity(0.1),
                  textColor: Colors.white,
                  onTap: onEdit,
                ),
                const SizedBox(width: 8),
                _buildSmallActionButton(
                  label: "Delete",
                  icon: Icons.delete_outline,
                  color: AppColors.error.withOpacity(0.15),
                  textColor: AppColors.textRed,
                  onTap: onDelete,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String username) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary.withOpacity(0.4)),
      ),
      alignment: Alignment.center,
      child: Text(
        username.characters.first.toUpperCase(),
        style: AppTextStyles.labelSemiBold.copyWith(
          color: AppColors.primary,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildStars(int rating) {
    return Row(
      children: List.generate(
        5,
        (i) => Icon(
          Icons.star_rounded,
          color: i < rating ? AppColors.primary : Colors.grey,
          size: 14,
        ),
      ),
    );
  }

  Widget _buildSmallActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required Color textColor,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: textColor),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.buttonSmallSemiBold.copyWith(
                color: textColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
