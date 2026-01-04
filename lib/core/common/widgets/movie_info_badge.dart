import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class MovieInfoBadge extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isTag; // للتفريق بين PG-13 والشارات الأخرى

  const MovieInfoBadge({
    super.key,
    required this.label,
    this.icon,
    this.isTag = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(
        horizontal: isTag ? 8 : 10,
        vertical: isTag ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: isTag ? Colors.transparent : AppColors.glassWhite10,
        borderRadius: BorderRadius.circular(isTag ? 4 : 8),
        border: Border.all(
          color: isTag ? Colors.white38 : AppColors.glassBorder,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: AppColors.textMuted, size: 14),
            const SizedBox(width: 4),
          ],
          Text(label, style: isTag ? AppTextStyles.badge : AppTextStyles.chip),
        ],
      ),
    );
  }
}
