import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_graduation_project/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_graduation_project/features/auth/Presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(AuthInitial());

  /// -----------------------------
  /// REGISTER
  /// -----------------------------
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
      (_) => emit(RegisterSuccess()),
    );
  }

  /// -----------------------------
  /// LOGIN
  /// -----------------------------
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    final result = await repository.login(email: email, password: password);

    result.fold((failure) => emit(AuthError(failure.message)), (user) async {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("token", user.token ?? "");

      await prefs.setString("email", user.email ?? "");
      await prefs.setString("name", user.name ?? "");

      emit(LoginSuccess(user));
    });
  }

  /// -----------------------------
  /// LOGOUT
  /// -----------------------------
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("token");
    await prefs.remove("email");
    await prefs.remove("name");

    emit(AuthInitial());
  }
}
