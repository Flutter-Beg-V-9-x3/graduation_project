import 'package:equatable/equatable.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_model.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MoviesLoaded extends MovieState {
  final List<MovieModel> movies;

  const MoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieDetailsLoaded extends MovieState {
  final MovieDetailsModel movieDetails;

  const MovieDetailsLoaded(this.movieDetails);

  @override
  List<Object> get props => [movieDetails];
}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);

  @override
  List<Object> get props => [message];
}
