import 'package:flutter_graduation_project/core/api/api_consumer.dart';
import 'package:flutter_graduation_project/core/api/api_constants.dart';
import 'package:flutter_graduation_project/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

abstract class MovieRemoteDataSource {
  Future<Map<String, dynamic>> getMovies();
  Future<Map<String, dynamic>> getMovieDetails(int id);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiConsumer apiConsumer;

  MovieRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Map<String, dynamic>> getMovies() async {
    try {
      final response = await apiConsumer.get(ApiConstants.movies);
      return response;
    } on DioException catch (e) {
      throw ServerException(
        message:
            e.response?.data['message'] ?? e.message ?? 'An error occurred',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getMovieDetails(int id) async {
    try {
      final response = await apiConsumer.get("${ApiConstants.movies}/$id");
      return response;
    } on DioException catch (e) {
      throw ServerException(
        message:
            e.response?.data['message'] ?? e.message ?? 'An error occurred',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
