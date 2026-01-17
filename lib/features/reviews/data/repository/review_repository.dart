import 'package:dartz/dartz.dart';
import 'package:flutter_graduation_project/core/errors/exceptions.dart';
import 'package:flutter_graduation_project/core/errors/failures.dart';
import 'package:flutter_graduation_project/features/reviews/data/datasource/review_remote_data_source.dart';
import 'package:flutter_graduation_project/features/reviews/data/models/review_model.dart';

class ReviewRepository {
  final ReviewRemoteDataSource remote;

  ReviewRepository(this.remote);

  Future<Either<Failure, List<ReviewModel>>> getMovieReviews(
    int movieId,
  ) async {
    try {
      final response = await remote.getMovieReviews(movieId);

      final dataList = response[0]["data"] as List;
      final reviews = dataList.map((e) => ReviewModel.fromJson(e)).toList();

      return Right(reviews);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, ReviewModel>> getSingleReview(
    int movieId,
    int reviewId,
  ) async {
    try {
      final response = await remote.getSingleReview(movieId, reviewId);

      final data = response[0]["data"];
      final review = ReviewModel.fromJson(data);

      return Right(review);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, ReviewModel>> createReview(
    int movieId, {
    required int rating,
    required String comment,
  }) async {
    try {
      final response = await remote.createReview(
        movieId,
        rating: rating,
        comment: comment,
      );

      final data = response[0]["data"];
      final review = ReviewModel.fromJson(data);

      return Right(review);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, ReviewModel>> updateReview(
    int movieId,
    int reviewId, {
    required int rating,
    required String comment,
  }) async {
    try {
      final response = await remote.updateReview(
        movieId,
        reviewId,
        rating: rating,
        comment: comment,
      );

      final data = response[0]["data"];
      final review = ReviewModel.fromJson(data);

      return Right(review);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
