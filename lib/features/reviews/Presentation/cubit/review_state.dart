import 'package:flutter_graduation_project/features/reviews/data/models/review_model.dart';

abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewsLoading extends ReviewState {}

class ReviewsLoaded extends ReviewState {
  final List<ReviewModel> reviews;
  ReviewsLoaded(this.reviews);
}

class ReviewsWithUserLoaded extends ReviewState {
  final List<ReviewModel> reviews;
  final ReviewModel? userReview;

  ReviewsWithUserLoaded({required this.reviews, required this.userReview});
}

class ReviewLoaded extends ReviewState {
  final ReviewModel review;
  ReviewLoaded(this.review);
}

class ReviewCreated extends ReviewState {
  final ReviewModel review;
  ReviewCreated(this.review);
}

class ReviewUpdated extends ReviewState {
  final ReviewModel review;
  ReviewUpdated(this.review);
}

class ReviewError extends ReviewState {
  final String message;
  ReviewError(this.message);
}
