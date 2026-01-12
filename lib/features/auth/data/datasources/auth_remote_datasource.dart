import 'package:flutter_graduation_project/core/api/api_constants.dart';
import 'package:flutter_graduation_project/core/api/api_consumer.dart';

abstract class AuthRemoteDataSource {
  Future<List<dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<List<dynamic>> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer api;

  AuthRemoteDataSourceImpl({required this.api});

  @override
  Future<List<dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await api.post(
      ApiConstants.register,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      },
    );

    return response as List<dynamic>;
  }

  @override
  Future<List<dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await api.post(
      ApiConstants.login,
      data: {
        "email": email,
        "password": password,
      },
    );

    return response as List<dynamic>;
  }
}
