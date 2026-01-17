import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'package:flutter_graduation_project/features/in_app_trailer_player/ui/view/trailer_player.dart';

class ActionRatingSection extends StatefulWidget {
  const ActionRatingSection({super.key, required MovieDetailsModel movie});

  @override
  State<ActionRatingSection> createState() => _ActionRatingSectionState();
}

class _ActionRatingSectionState extends State<ActionRatingSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primary,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryShadow,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrailerPlayer(
                        videoUrl:
                            'https://dn710206.ca.archive.org/0/items/batman-beyond-trailers-tv-promos-and-bumpers-collection/Batman%20Beyond%20Animated%20VHS%20Collection%20Trailer.mp4',
                        posterUrl: 'assets/images/3.png',
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  size: 24,
                  color: AppColors.textPrimary,
                ),
                label: Text(
                  "Watch Trailer",
                  style: AppTextStyles.button.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.textPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Icons.bookmark_add_rounded,
              color: Colors.white,
              size: 24,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.12),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              fixedSize: const Size(48, 48),
              side: BorderSide(color: Colors.white.withOpacity(0.25), width: 1),
            ),
          ),
        ],
      ),
    );
  }
}
