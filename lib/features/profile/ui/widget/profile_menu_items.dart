import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';

class ProfileMenuItems extends StatelessWidget {
  const ProfileMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _item(Icons.bookmark, 'My Watchlist'),
        _divider(),
        _item(Icons.rate_review, 'My Reviews'),
        _divider(),
        _item(Icons.settings, 'Settings'),
        _divider(),
      ],
    );
  }

  Widget _item(IconData icon, String title) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            /// Icon box
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primary, size: 24),
            ),

            const SizedBox(width: 16),

            /// Title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            /// Arrow
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 24),
      child: Divider(height: 1, thickness: 1, color: AppColors.borderWhite5),
    );
  }
}
