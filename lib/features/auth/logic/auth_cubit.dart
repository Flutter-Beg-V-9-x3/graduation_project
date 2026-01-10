import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_graduation_project/features/auth/logic/auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(AuthInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(AuthLoading());

    final result = await repository.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await repository.login(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
