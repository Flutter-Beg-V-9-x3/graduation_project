import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  bool isLikeHovered = false;
  bool isEditHovered = false;
  bool isDeleteHovered = false;
  bool isOptionsHovered = false;
  int likeCount = 24;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withOpacity(0.4)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "You",
                  style: AppTextStyles.labelSemiBold.copyWith(
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Review",
                      style: AppTextStyles.reviewUsername.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildStars(),
                        const SizedBox(width: 8),

                        Text(
                          "Oct 24, 2023",
                          style: AppTextStyles.reviewDate.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MouseRegion(
                onEnter: (_) => setState(() => isOptionsHovered = true),
                onExit: (_) => setState(() => isOptionsHovered = false),
                child: Icon(
                  Icons.more_horiz,
                  color: isOptionsHovered ? Colors.white : AppColors.textMuted,
                  size: 22,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 2. Review Content
          Text(
            "Absolutely mind-blowing visuals and a soundtrack that stays with you for days. While the physics can be dense, the emotional core of the father-daughter relationship grounds it perfectly. A masterpiece.",
            style: AppTextStyles.reviewContent.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.6,
            ),
          ),

          const SizedBox(height: 16),
          Divider(color: AppColors.primary.withOpacity(0.1), thickness: 1),
          const SizedBox(height: 12),

          // 3. Action Buttons
          Row(
            children: [
              _buildLikeButton(),
              const Spacer(),
              _buildSmallActionButton(
                label: "Edit",
                icon: Icons.edit_outlined,
                isHovered: isEditHovered,
                baseColor: Colors.white.withOpacity(0.05),
                activeColor: Colors.white.withOpacity(0.15),
                textColor: Colors.white,
                onHover: (v) => setState(() => isEditHovered = v),
              ),
              const SizedBox(width: 8),
              _buildSmallActionButton(
                label: "Delete",
                icon: Icons.delete_outline,
                isHovered: isDeleteHovered,
                baseColor: AppColors.error.withOpacity(0.1),
                activeColor: AppColors.error.withOpacity(0.2),
                textColor: AppColors.textRed,
                onHover: (v) => setState(() => isDeleteHovered = v),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLikeButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => isLikeHovered = true),
      onExit: (_) => setState(() => isLikeHovered = false),
      child: GestureDetector(
        onTap: () => setState(() => likeCount++),
        child: Row(
          children: [
            Icon(
              isLikeHovered ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
              size: 16,
              color: isLikeHovered
                  ? AppColors.primary
                  : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              "$likeCount",
              style: AppTextStyles.captionSmall.copyWith(
                color: isLikeHovered
                    ? AppColors.primary
                    : AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStars() {
    return Row(
      children: List.generate(
        5,
        (index) =>
            const Icon(Icons.star_rounded, color: AppColors.primary, size: 14),
      ),
    );
  }

  Widget _buildSmallActionButton({
    required String label,
    required IconData icon,
    required bool isHovered,
    required Color baseColor,
    required Color activeColor,
    required Color textColor,
    required Function(bool) onHover,
  }) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isHovered ? activeColor : baseColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}
