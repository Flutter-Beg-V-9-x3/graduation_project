import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;
  final VoidCallback? onCenterButtonPressed;

  const CustomBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
    this.onCenterButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ⬇️ أحجام دقيقة
    const buttonSize = 48.0;
    const containerSize = 58.0;

    return Container(
      height: 68,
      color: AppColors.background,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ===== الخط العلوي الكامل =====
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(height: 1, color: AppColors.divider),
          ),

          // ===== العناصر الأربعة =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, Icons.home_filled, 'Home'),
              _buildNavItem(1, Icons.search, 'Search'),
              SizedBox(width: containerSize),
              _buildNavItem(2, Icons.reviews, 'Reviews'),
              _buildNavItem(3, Icons.person, 'Profile'),
            ],
          ),

          // ===== الظل الأخف تحت الـ Container =====
          Positioned(
            top: 8,
            left: (screenWidth / 2) - (containerSize / 2),
            child: Container(
              width: containerSize,
              height: containerSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  // ⬇️ ظل خفيف جداً
                  BoxShadow(
                    color: AppColors.primary.withOpacity(
                      0.25,
                    ), // ⬅️ opacity أقل
                    blurRadius: 16, // ⬅️ blur أقل
                    spreadRadius: 1, // ⬅️ spread أقل
                    offset: Offset(0, 2), // ⬅️ offset أقل
                  ),
                ],
              ),
            ),
          ),

          // ===== الـ Container الدائري فوق الخط =====
          Positioned(
            top: -5,
            left: (screenWidth / 2) - (containerSize / 2),
            child: Container(
              width: containerSize,
              height: containerSize,
              decoration: BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: GestureDetector(
                  onTap: onCenterButtonPressed,
                  child: Container(
                    width: buttonSize,
                    height: buttonSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.add, color: Colors.white, size: 30),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        padding: EdgeInsets.only(top: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? _getFilledIcon(icon) : icon,
              color: isSelected ? AppColors.primary : AppColors.textMuted,
              size: 22,
            ),
            SizedBox(height: 6),
            Text(
              label,
              style: AppTextStyles.captionSmall.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textMuted,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getFilledIcon(IconData outlineIcon) {
    switch (outlineIcon) {
      case Icons.home_outlined:
        return Icons.home;
      case Icons.search_outlined:
        return Icons.search;
      case Icons.reviews_outlined:
        return Icons.reviews;
      case Icons.person_outlined:
        return Icons.person;
      default:
        return outlineIcon;
    }
  }
}
