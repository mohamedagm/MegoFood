import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mego_food/core/api/api_consumer.dart';
import 'package:mego_food/core/api/api_end_points.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/auth/data/models/error_login_model.dart';
import 'package:mego_food/features/auth/data/models/success_login_model.dart';
import 'package:mego_food/features/auth/data/models/validation_error_login_model.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer apiConsumer;
  AuthRepoImpl(this.apiConsumer);
  @override
  Future<Either<Failures, SuccessLoginModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoints.login,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );
      return right(SuccessLoginModel.fromJson(response.data));
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return left(Failures("Timeout error, please try again"));

        case DioExceptionType.connectionError:
          return left(Failures("No internet connection"));

        case DioExceptionType.cancel:
          return left(Failures("Request was cancelled"));

        case DioExceptionType.badCertificate:
          return left(Failures("Bad SSL certificate"));

        case DioExceptionType.badResponse:
          final data = e.response?.data;
          if (data is Map<String, dynamic>) {
            if (data.containsKey('errors')) {
              return left(ValidationErrorLoginModel.fromJson(data));
            } else if (data.containsKey('error')) {
              return left(ErrorLoginModel.fromJson(data));
            }
          }
          return left(Failures("Server returned an error"));

        case DioExceptionType.unknown:
          return left(Failures("Unexpected error occurred"));
      }
    }
  }

  @override
  Future<Either<Failures, SuccessLoginModel>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, SuccessLoginModel>> register(
    String email,
    String password,
  ) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
