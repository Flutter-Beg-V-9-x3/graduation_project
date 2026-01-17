
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ActionRatingSection extends StatefulWidget {
  const ActionRatingSection({super.key});

  @override
  State<ActionRatingSection> createState() => _ActionRatingSectionState();
}

class _ActionRatingSectionState extends State<ActionRatingSection> {
  bool isBookmarkHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          // 1. زر مشاهدة العرض الدعائي (Watch Trailer)
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: OutlinedButton.icon(
              
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow_outlined,
                  size: 22,
                ), //
                label: const Text("Watch Trailer"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.primary.withOpacity(
                    0.1,
                  ), // 
                  textStyle: AppTextStyles.button.copyWith(fontSize: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          
          MouseRegion(
            onEnter: (_) => setState(() => isBookmarkHovered = true),
            onExit: (_) => setState(() => isBookmarkHovered = false),
            child: GestureDetector(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                
                  color: isBookmarkHovered
                      ? Colors.white
                      : AppColors.surfaceAlt,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isBookmarkHovered
                        ? Colors.white
                        : Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Icon(
                  
                  isBookmarkHovered
                      ? Icons.bookmark_add
                      : Icons.bookmark_add_outlined,
                  color: isBookmarkHovered
                      ? AppColors.background
                      : Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
