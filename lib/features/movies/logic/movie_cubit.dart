import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/movies/data/repository/movie_repository.dart';
import 'package:flutter_graduation_project/features/movies/logic/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository repository;

  MovieCubit(this.repository) : super(MovieInitial());

  /// Fetch all movies
  Future<void> fetchMovies() async {
    emit(MovieLoading());

    final result = await repository.getMovies();

    result.fold(
      (failure) => emit(MovieError(failure.message)),
      (movies) => emit(MoviesLoaded(movies)),
    );
  }

  /// Fetch movie details
  Future<void> fetchMovieDetails(int id) async {
    emit(MovieLoading());

    final result = await repository.getMovieDetails(id);

    result.fold(
      (failure) => emit(MovieError(failure.message)),
      (movie) => emit(MovieDetailsLoaded(movie)),
    );
  }
}
