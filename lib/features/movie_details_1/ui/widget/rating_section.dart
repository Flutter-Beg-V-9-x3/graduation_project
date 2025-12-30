import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingSection extends StatefulWidget {
  final double initialRating;
  final ValueChanged<double>? onRatingChanged;

  const RatingSection({
    super.key,
    this.initialRating = 4.0,
    this.onRatingChanged,
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('TAP TO RATE', style: AppTextStyles.bodyMedium),

        const SizedBox(height: 10),

        // Stars
        RatingBar.builder(
          initialRating: _rating,
          minRating: 1,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 6),
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Color(0xff7f13ec)),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
            widget.onRatingChanged?.call(rating);
          },
        ),

        const SizedBox(height: 12),

        // Rating text
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
