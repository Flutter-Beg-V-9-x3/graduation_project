import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/reviews/data/repository/review_repository.dart';
import 'package:flutter_graduation_project/features/reviews/logic/review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final ReviewRepository repository;

  ReviewCubit(this.repository) : super(ReviewInitial());

  Future<void> getMovieReviews(int movieId) async {
    emit(ReviewsLoading());

    final result = await repository.getMovieReviews(movieId);

    result.fold(
      (failure) => emit(ReviewError(failure.message)),
      (reviews) => emit(ReviewsLoaded(reviews)),
    );
  }

  Future<void> getSingleReview(int movieId, int reviewId) async {
    emit(ReviewsLoading());

    final result = await repository.getSingleReview(movieId, reviewId);

    result.fold(
      (failure) => emit(ReviewError(failure.message)),
      (review) => emit(ReviewLoaded(review)),
    );
  }

  Future<void> createReview(
    int movieId, {
    required int rating,
    required String comment,
  }) async {
    emit(ReviewsLoading());

    final result = await repository.createReview(
      movieId,
      rating: rating,
      comment: comment,
    );

    result.fold(
      (failure) => emit(ReviewError(failure.message)),
      (review) => emit(ReviewCreated(review)),
    );
  }

  Future<void> updateReview(
    int movieId,
    int reviewId, {
    required int rating,
    required String comment,
  }) async {
    emit(ReviewsLoading());

    final result = await repository.updateReview(
      movieId,
      reviewId,
      rating: rating,
      comment: comment,
    );

    result.fold(
      (failure) => emit(ReviewError(failure.message)),
      (review) => emit(ReviewUpdated(review)),
    );
  }
}
