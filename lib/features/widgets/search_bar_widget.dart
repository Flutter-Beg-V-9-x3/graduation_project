import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  bool _isMainBoxHovered = false;
  bool _isFilterHovered = false;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isMainBoxHovered = true),
        onExit: (_) => setState(() => _isMainBoxHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 52,
          padding: const EdgeInsets.only(left: 16, right: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF251B2F),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _isFocused
                  ? AppColors.primary
                  : Colors.white.withOpacity(_isMainBoxHovered ? 0.12 : 0.06),
              width: 1.0,
            ),

            boxShadow: _isFocused
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.08),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 22,
                color: (_isFocused || _isMainBoxHovered)
                    ? AppColors.primary
                    : Colors.white.withOpacity(0.25),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.5,
                    fontFamily: 'Be Vietnam Pro',
                  ),
                  cursorColor: AppColors.primary,
                  decoration: InputDecoration(
                    hintText: "Search movies, actors...",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.2),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),

              MouseRegion(
                onEnter: (_) => setState(() => _isFilterHovered = true),
                onExit: (_) => setState(() => _isFilterHovered = false),
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: _isFilterHovered
                        ? Colors.white.withOpacity(0.05)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.tune,
                    size: 19,
                    color: _isFilterHovered
                        ? AppColors.primary
                        : Colors.white.withOpacity(0.4),
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
