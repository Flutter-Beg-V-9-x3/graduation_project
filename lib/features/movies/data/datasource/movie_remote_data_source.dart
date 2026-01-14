import 'package:flutter_graduation_project/core/api/api_consumer.dart';
import 'package:flutter_graduation_project/core/api/api_constants.dart';

abstract class MovieRemoteDataSource {
  Future<Map<String, dynamic>> getMovies();
  Future<List<dynamic>> getMovieDetails(int id);
}


class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiConsumer api;

  MovieRemoteDataSourceImpl(this.api);

  @override
  Future<Map<String, dynamic>> getMovies() async {
    final response = await api.get(ApiConstants.movies);
    return response as Map<String, dynamic>;
  }

  @override
  Future<List<dynamic>> getMovieDetails(int id) async {
    final response = await api.get("${ApiConstants.movies}/$id");
    return response as List<dynamic>;
  }
}