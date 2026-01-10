import 'package:dartz/dartz.dart';
import 'package:flutter_graduation_project/core/errors/exceptions.dart';
import 'package:flutter_graduation_project/core/errors/failures.dart';
import 'package:flutter_graduation_project/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_graduation_project/features/auth/data/models/user_model.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      // response شكلها: [ { data: {...}, message: "" }, 201 ]
      final List<dynamic> responseList = response as List<dynamic>;
      final Map<String, dynamic> body = responseList[0] as Map<String, dynamic>;
      final Map<String, dynamic> data = body["data"] ?? {};

      final user = UserModel.fromJson(data);

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login(
        email: email,
        password: password,
      );

      // response شكلها: [ { data: { user: {...}, token: "..." }, message: "" }, 200 ]
      final List<dynamic> responseList = response as List<dynamic>;
      final Map<String, dynamic> body = responseList[0] as Map<String, dynamic>;
      final Map<String, dynamic> data = body["data"] ?? {};
      final Map<String, dynamic> userJson = data["user"] ?? {};

      final user = UserModel.fromJson({
        ...userJson,
        "token": data["token"],
      });

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
