import 'package:dio/dio.dart';
import 'package:flutter_graduation_project/core/api/interceptors/logging_interceptor.dart';
import 'package:flutter_graduation_project/core/api/interceptors/token_interceptor.dart';
import 'api_consumer.dart';


class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options
      ..baseUrl = ""
      ..connectTimeout = const Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20)
      ..headers = {
        "Accept": "application/json",
      };

    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(TokenInterceptor());
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get(path, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future post(String path, {data, Map<String, dynamic>? queryParameters}) async {
    final response = await dio.post(path, data: data, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future put(String path, {data, Map<String, dynamic>? queryParameters}) async {
    final response = await dio.put(path, data: data, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future delete(String path, {data, Map<String, dynamic>? queryParameters}) async {
    final response = await dio.delete(path, data: data, queryParameters: queryParameters);
    return response.data;
  }
}
