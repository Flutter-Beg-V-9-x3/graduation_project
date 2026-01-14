import 'package:flutter_graduation_project/features/movies/data/models/movie_model.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MoviesLoaded extends MovieState {
  final List<MovieModel> movies;
  MoviesLoaded(this.movies);
}

class MovieDetailsLoaded extends MovieState {
  final MovieDetailsModel movie;
  MovieDetailsLoaded(this.movie);
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}