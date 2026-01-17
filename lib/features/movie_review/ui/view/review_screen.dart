import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/app_button.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/discard_changes.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/review_comment_box.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/review_header.dart';
import 'package:flutter_graduation_project/features/reviews/logic/review_cubit.dart';

class ReviewScreen extends StatefulWidget {
  final int movieId;
  final String movieTitle;
  final String moviePoster;
  final String movieInfo;

  const ReviewScreen({
    super.key,
    required this.movieId,
    required this.movieTitle,
    required this.moviePoster,
    required this.movieInfo,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  String comment = "";
  int rating = 0;

  void onBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReviewHeader(
            onBack: onBack,
            onCancel: onBack,
            movieTitle: widget.movieTitle,
            moviePoster: widget.moviePoster,
            movieInfo: widget.movieInfo,
            onRatingSelected: (value) {
              setState(() => rating = value);
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  ReviewCommentBox(onChanged: (value) => comment = value),

                  const SizedBox(height: 12),

                  AppButton(
                    text: 'Submit Review',
                    onPressed: () {
                      if (comment.isEmpty || rating == 0) return;
                      context.read<ReviewCubit>().createReview(
                        widget.movieId,
                        rating: rating,
                        comment: comment,
                      );
                      Navigator.pop(context);
                      context.read<ReviewCubit>().getMovieReviews(
                        widget.movieId,
                      );
                    },
                  ),

                  const SizedBox(height: 12),

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
