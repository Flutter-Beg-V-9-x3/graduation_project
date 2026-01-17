import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/reviews/data/repository/review_repository.dart';
import 'package:flutter_graduation_project/features/reviews/Presentation/cubit/review_state.dart';

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

  Future<void> loadReviewsWithUser({
    required int movieId,
    required String userName,
    required String userEmail,
  }) async {
    emit(ReviewsLoading());

    final result = await repository.getMovieReviews(movieId);

    await result.fold(
      (failure) async {
        emit(ReviewError(failure.message));
      },
      (reviews) async {
        final normalizedEmail = userEmail.trim().toLowerCase();
        final normalizedName = userName.trim();

        final userReviews = reviews.where((r) {
          final emailMatch =
              r.user.email.trim().toLowerCase() == normalizedEmail;
          final nameMatch = normalizedName.isEmpty
              ? true
              : r.user.name.trim() == normalizedName;
          return emailMatch && nameMatch;
        }).toList();

        if (userReviews.isEmpty) {
          emit(ReviewsWithUserLoaded(reviews: reviews, userReview: null));
        } else {
          final lastUserReview = userReviews.last;

          final singleResult = await repository.getSingleReview(
            movieId,
            lastUserReview.id,
          );

          singleResult.fold((failure) => emit(ReviewError(failure.message)), (
            fullReview,
          ) {
            emit(
              ReviewsWithUserLoaded(reviews: reviews, userReview: fullReview),
            );
          });
        }
      },
    );
  }
}
