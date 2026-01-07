import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isBordered;

  const InfoChip({
    super.key,
    required this.label,
    this.icon,
    this.isBordered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isBordered ? Colors.transparent : AppColors.glassWhite5,
        borderRadius: BorderRadius.circular(8),
        border: isBordered ? Border.all(color: AppColors.divider) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: AppColors.textMuted),
            const SizedBox(width: 4),
          ],
          Text(label, style: AppTextStyles.chip),
        ],
      ),
    );
  }
}
