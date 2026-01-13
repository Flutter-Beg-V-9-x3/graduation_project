import 'package:dartz/dartz.dart';
import 'package:flutter_graduation_project/core/errors/exceptions.dart';
import 'package:flutter_graduation_project/core/errors/failures.dart';
import 'package:flutter_graduation_project/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_model.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieModel>>> getMovies();
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int id);
}

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MovieModel>>> getMovies() async {
    try {
      final response = await remoteDataSource.getMovies();

      final List<dynamic> moviesList = response[0]['data'] as List<dynamic>;

      final List<MovieModel> movies = moviesList
          .map((movieJson) => MovieModel.fromJson(movieJson))
          .toList();

      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int id) async {
    try {
      final response = await remoteDataSource.getMovieDetails(id);

      final Map<String, dynamic> movieData =
          response['data'] as Map<String, dynamic>;

      final MovieDetailsModel movieDetails = MovieDetailsModel.fromJson(
        movieData,
      );

      return Right(movieDetails);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
