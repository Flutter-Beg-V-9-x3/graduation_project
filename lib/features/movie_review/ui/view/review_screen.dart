import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/app_button.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/discard_changes.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/movie_review_header.dart';
import 'package:flutter_graduation_project/features/movie_review/ui/widget/review_comment_box.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  void onBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReviewHeader(onBack: onBack, onCancel: () {}),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  ReviewCommentBox(),
                  const SizedBox(height: 12),
                  AppButton(text: 'Submit Review', onPressed: () {}),
                  const SizedBox(height: 12),
                  secondaryTextButton("Discard Changes", () {}),
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