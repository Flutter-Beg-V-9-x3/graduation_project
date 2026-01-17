import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/movies/data/repository/movie_repository.dart';
import 'package:flutter_graduation_project/features/movies/Presentation/cubit/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieRepository repository;

  MovieDetailsCubit(this.repository) : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(int id) async {
    emit(MovieDetailsLoading());

    final result = await repository.getMovieDetails(id);

    result.fold(
      (failure) => emit(MovieDetailsError(failure.message)),
      (movie) => emit(MovieDetailsLoaded(movie)),
    );
  }
}