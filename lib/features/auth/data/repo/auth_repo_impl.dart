import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mego_food/core/api/api_consumer.dart';
import 'package:mego_food/core/api/api_end_points.dart';
import 'package:mego_food/core/errors/dio_exceptions.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/auth/data/models/success_login_model.dart';
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
      return left(DioExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<Failures, SuccessLoginModel>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, Unit>> register(String email, String password) async {
    try {
      await apiConsumer.post(
        ApiEndPoints.register,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );
      return right(unit);
    } on DioException catch (e) {
      return left(DioExceptions.fromDioError(e));
    }
  }
}
