import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Custom Widget Imports
import 'package:flutter_graduation_project/features/reviews/Presentation/cubit/review_cubit.dart';
import 'package:flutter_graduation_project/features/reviews/Presentation/ui/widget/app_button.dart';
import 'package:flutter_graduation_project/features/reviews/Presentation/ui/widget/discard_changes.dart';
import 'package:flutter_graduation_project/features/reviews/Presentation/ui/widget/review_comment_box.dart';
import 'package:flutter_graduation_project/features/reviews/Presentation/ui/widget/review_header.dart';

/// Screen for creating a new review or editing an existing one.
class ReviewScreen extends StatefulWidget {
  // --- Required Details for the Movie ---
  final int movieId;
  final String movieTitle;
  final String moviePoster;
  final String movieInfo;

  // --- Optional Details for 'Edit Mode' ---
  final int? reviewId;
  final int? initialRating;
  final String? initialComment;

  const ReviewScreen({
    super.key,
    required this.movieId,
    required this.movieTitle,
    required this.moviePoster,
    required this.movieInfo,
    this.reviewId,
    this.initialRating,
    this.initialComment,
  });

  /// Checks if the screen is in 'Edit Mode' based on the presence of [reviewId].
  bool get isEditMode => reviewId != null;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  // State variables to hold user input
  late String comment;
  late int rating;

  @override
  void initState() {
    super.initState();
    // Initialize state. If in Edit Mode, pre-fill with existing data.
    comment = widget.initialComment ?? "";
    rating = widget.initialRating ?? 0;
  }

  /// Handles the back navigation.
  void onBack() {
    Navigator.pop(context);
  }

  /// Handles the submission of the review (Create or Update).
  Future<void> _submitReview() async {
    // 1. Basic Validation: Ensure rating and comment are provided.
    if (comment.isEmpty || rating == 0) return;

    if (widget.isEditMode) {
      // 2. Handle Update Logic
      await context.read<ReviewCubit>().updateReview(
            widget.movieId,
            widget.reviewId!,
            rating: rating,
            comment: comment,
          );
    } else {
      // 3. Handle Create Logic
      await context.read<ReviewCubit>().createReview(
            widget.movieId,
            rating: rating,
            comment: comment,
          );
    }

    // 4. Return 'true' to indicate success to the previous screen.
    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // --- Top Section: Header & Star Rating ---
          ReviewHeader(
            onBack: onBack,
            onCancel: onBack,
            movieTitle: widget.movieTitle,
            moviePoster: widget.moviePoster,
            movieInfo: widget.movieInfo,
            // Update the local rating state when user selects stars
            onRatingSelected: (value) {
              setState(() => rating = value);
            },
          ),

          // --- Bottom Section: Comment Input & Buttons ---
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  // Text Input for Review
                  ReviewCommentBox(
                    initialText: widget.initialComment,
                    onChanged: (value) => comment = value,
                  ),

                  const SizedBox(height: 12),

                  // Main Action Button (Submit / Update)
                  AppButton(
                    text: widget.isEditMode ? 'Update Review' : 'Submit Review',
                    onPressed: _submitReview,
                  ),

                  const SizedBox(height: 12),

                  // Secondary Button (Discard / Cancel)
                  secondaryTextButton("Discard Changes", onBack),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}