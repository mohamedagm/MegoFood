import 'package:dio/dio.dart';
import 'package:mego_food/core/api/api_consumer.dart';
import 'package:mego_food/core/api/api_interceptor.dart';
import 'package:mego_food/core/api/api_end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  @override
  Future<Response> get(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get(
      path,
      data: isFormData && data is Map<String, dynamic>
          ? FormData.fromMap(data)
          : data,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> post(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.post(
      path,
      data: isFormData && data is Map<String, dynamic>
          ? FormData.fromMap(data)
          : data,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> patch(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.patch(
      path,
      data: isFormData && data is Map<String, dynamic>
          ? FormData.fromMap(data)
          : data,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> delete(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.delete(
      path,
      data: isFormData && data is Map<String, dynamic>
          ? FormData.fromMap(data)
          : data,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) {
    return dio.put(
      path,
      data: isFormData && data is Map<String, dynamic>
          ? FormData.fromMap(data)
          : data,
      queryParameters: queryParameters,
    );
  }
}
