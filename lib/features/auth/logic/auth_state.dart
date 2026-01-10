import 'package:flutter_graduation_project/features/auth/data/models/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class LoginSuccess extends AuthState {
  final UserModel user;
  LoginSuccess(this.user);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}