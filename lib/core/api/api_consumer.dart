import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<Response> get(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> post(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<Response> patch(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> delete(
    String path, {
    bool isFormData = false,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
