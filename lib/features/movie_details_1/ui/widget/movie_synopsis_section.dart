import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class MovieSynopsisSection extends StatelessWidget {
  const MovieSynopsisSection({super.key, required  MovieDetailsModel movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Synopsis",
            style: AppTextStyles.sectionTitle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),

          Text(
            "Earth's future has been riddled by disasters,"
            " famines, and droughts.There is only one "
            " way to ensure mankind's survival: "
            "Interstellar travel.A newly discovered "
            " wormhole in the far reaches of our solar"
            " system allowsa team of astronauts to go "
            " where no man has gone before, a planet"
            " that may have the right environment to "
            "sustain human life.",
            style: AppTextStyles.body.copyWith(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 8),

          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Read more",
                  style: AppTextStyles.link.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
