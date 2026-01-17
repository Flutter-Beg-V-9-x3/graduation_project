import 'package:flutter_graduation_project/core/api/api_consumer.dart';
import 'package:flutter_graduation_project/core/api/api_constants.dart';

abstract class ReviewRemoteDataSource {
  Future<List<dynamic>> getMovieReviews(int movieId);
  Future<List<dynamic>> getSingleReview(int movieId, int reviewId);
  Future<List<dynamic>> createReview(
    int movieId, {
    required int rating,
    required String comment,
  });
  Future<List<dynamic>> updateReview(
    int movieId,
    int reviewId, {
    required int rating,
    required String comment,
  });
}

class ReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  final ApiConsumer api;

  ReviewRemoteDataSourceImpl(this.api);

  @override
  Future<List<dynamic>> getMovieReviews(int movieId) async {
    final response = await api.get("${ApiConstants.movies}/$movieId/reviews");
    return response as List<dynamic>;
  }

  @override
  Future<List<dynamic>> getSingleReview(int movieId, int reviewId) async {
    final response = await api.get(
      "${ApiConstants.movies}/$movieId/reviews/$reviewId",
    );
    return response as List<dynamic>;
  }

  @override
  Future<List<dynamic>> createReview(
    int movieId, {
    required int rating,
    required String comment,
  }) async {
    final body = {"rating": rating, "comment": comment};

    final response = await api.post(
      "${ApiConstants.movies}/$movieId/reviews",
      data: body,
    );

    return response as List<dynamic>;
  }

  @override
  Future<List<dynamic>> updateReview(
    int movieId,
    int reviewId, {
    required int rating,
    required String comment,
  }) async {
    final body = {"rating": rating, "comment": comment};

    final response = await api.put(
      "${ApiConstants.movies}/$movieId/reviews/$reviewId",
      data: body,
    );

    return response as List<dynamic>;
  }
}
