import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/movies/data/repository/movie_repository.dart';
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository movieRepository;

  MovieCubit({required this.movieRepository}) : super(MovieInitial());

  void fetchMovies() async {
    emit(MovieLoading());

    final result = await movieRepository.getMovies();

    result.fold(
      (failure) => emit(MovieError(failure.message)),
      (movies) => emit(MoviesLoaded(movies)),
    );
  }

  void fetchMovieDetails(int movieId) async {
    emit(MovieLoading());

    final result = await movieRepository.getMovieDetails(movieId);

    result.fold(
      (failure) => emit(MovieError(failure.message)),
      (movieDetails) => emit(MovieDetailsLoaded(movieDetails)),
    );
  }
}
