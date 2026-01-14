import 'package:dartz/dartz.dart';
import 'package:flutter_graduation_project/core/errors/failures.dart';
import 'package:flutter_graduation_project/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_model.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';

class MovieRepository {
  final MovieRemoteDataSource remote;

  MovieRepository(this.remote);

  Future<Either<Failure, List<MovieModel>>> getMovies() async {
    try {
      final response = await remote.getMovies();
      final List moviesJson = response["data"];
      final movies = moviesJson.map((e) => MovieModel.fromJson(e)).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int id) async {
    try {
      final response = await remote.getMovieDetails(id);

      // response = [ {data: {...}}, 200 ]
      final data = response[0]["data"];

      return Right(MovieDetailsModel.fromJson(data));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}