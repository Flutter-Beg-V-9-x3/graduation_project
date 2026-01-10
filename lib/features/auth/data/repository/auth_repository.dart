import 'package:dartz/dartz.dart';
import 'package:flutter_graduation_project/core/errors/failures.dart';
import 'package:flutter_graduation_project/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
}
