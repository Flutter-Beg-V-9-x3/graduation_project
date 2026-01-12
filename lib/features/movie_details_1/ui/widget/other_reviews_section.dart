import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'other_review_item.dart';

class OtherReviewsSection extends StatelessWidget {
  const OtherReviewsSection({super.key});

  final List<Map<String, dynamic>> reviews = const [
    {
      'initials': 'JD',
      'name': 'John Doe',
      'timeAgo': '2 days ago',
      'reviewText':
          'Christopher Nolan does it again. The docking scene is perhaps the most tense sequence in cinema history.',
      'stars': 5,
    },
    {
      'initials': 'SA',
      'name': 'Sarah A.',
      'timeAgo': '1 week ago',
      'reviewText':
          'Beautiful, haunting, and scientifically fascinating. It\'s a bit long, but worth every minute.',
      'stars': 5,
    },
    {
      'initials': 'MK',
      'name': 'Mike K.',
      'timeAgo': '2 weeks ago',
      'reviewText':
          'I didn\'t quite understand the ending, but the journey there was incredible.',
      'stars': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          OtherReviewItem(
            initials: 'JD',
            name: 'John Doe',
            timeAgo: '2 days ago',
            reviewText:
                'Christopher Nolan does it again. The docking scene is perhaps the most tense sequence in cinema history.',
            starCount: 5,
            circleColor: AppColors.textBlue,
          ),

          const SizedBox(height: 8),

          OtherReviewItem(
            initials: 'SA',
            name: 'Sarah A.',
            timeAgo: '1 week ago',
            reviewText:
                'Beautiful, haunting, and scientifically fascinating. It\'s a bit long, but worth every minute.',
            starCount: 5,
            circleColor: AppColors.textGreen,
          ),

          const SizedBox(height: 8),

          OtherReviewItem(
            initials: 'MK',
            name: 'Mike K.',
            timeAgo: '2 weeks ago',
            reviewText:
                'I didn\'t quite understand the ending, but the journey there was incredible.',
            starCount: 5,
            circleColor: AppColors.primary,
          ),

          const SizedBox(height: 8),

          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  "View All Reviews",
                  style: AppTextStyles.button.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
