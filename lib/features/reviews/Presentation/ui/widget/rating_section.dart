import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingSection extends StatefulWidget {
  final double initialRating;
  final ValueChanged<double>? onRatingChanged;
  final ValueChanged<int> onRatingSelected;

  const RatingSection({
    super.key,
    this.initialRating = 4.0,
    this.onRatingChanged,
    required this.onRatingSelected,
  });

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onRatingSelected(_rating.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('TAP TO RATE', style: AppTextStyles.bodyMedium),
        const SizedBox(height: 10),

        RatingBar.builder(
          initialRating: _rating,
          minRating: 1,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 6),
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color:AppColors.ratingStarHalf),
          onRatingUpdate: (rating) {
            setState(() => _rating = rating);

            widget.onRatingChanged?.call(rating);
            widget.onRatingSelected(rating.toInt());
          },
        ),

        const SizedBox(height: 12),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: _rating.toStringAsFixed(1),
                style: AppTextStyles.ratingValue,
              ),
              const TextSpan(text: ' / 5.0', style: AppTextStyles.ratingLabel),
            ],
          ),
        ),
      ],
    );
  }
}
