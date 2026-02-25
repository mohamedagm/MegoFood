import 'package:dio/dio.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/auth/data/models/error_login_model.dart';

class DioExceptions extends Failures {
  DioExceptions(super.message);

  static Failures fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return DioExceptions("Timeout error, please try again");

      case DioExceptionType.connectionError:
        return DioExceptions("No internet connection");

      case DioExceptionType.cancel:
        return DioExceptions("Request was cancelled");

      case DioExceptionType.badCertificate:
        return DioExceptions("Bad SSL certificate");

      case DioExceptionType.badResponse:
        final data = e.response?.data;

        if (data is Map<String, dynamic>) {
          return ErrorAuthModel.fromJson(data);
        }

        return DioExceptions("Server returned an error");

      case DioExceptionType.unknown:
        return DioExceptions("Unexpected error occurred");
    }
  }
}
