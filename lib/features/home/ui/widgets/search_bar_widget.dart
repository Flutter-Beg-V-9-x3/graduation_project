import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  bool _isMainBoxHovered = false;
  bool _isFilterHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isMainBoxHovered = true),
        onExit: (_) => setState(() => _isMainBoxHovered = false),
        child: Container(
          height: 48,
          padding: const EdgeInsets.only(left: 16, right: 8),
          decoration: BoxDecoration(
            color: AppColors.glassWhite5,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.white.withOpacity(0.10),
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                size: 27,
                color: AppColors.textSecondary.withOpacity(0.9),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  "Search movies, actors...",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary.withOpacity(0.9),
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.15,
                    height: 1.2,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              MouseRegion(
                onEnter: (_) => setState(() => _isFilterHovered = true),
                onExit: (_) => setState(() => _isFilterHovered = false),
                cursor: SystemMouseCursors.click,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: _isFilterHovered
                        ? Colors.white.withOpacity(0.15)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.tune_rounded,
                    size: 28,
                    color: AppColors.textSecondary.withOpacity(0.9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
