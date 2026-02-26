import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mego_food/core/api/api_consumer.dart';
import 'package:mego_food/core/api/api_end_points.dart';
import 'package:mego_food/core/cache/cache_helper.dart';
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
      final model = SuccessLoginModel.fromJson(response.data);
      await CacheHelper.saveData(key: 'token', value: model.token);
      await CacheHelper.saveData(
        key: 'refreshToken',
        value: model.refreshToken,
      );
      return right(model);
    } on DioException catch (e) {
      return left(DioExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<Failures, String>> forgetPassword(String email) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoints.forgetPassword,
        data: {ApiKeys.email: email},
      );
      return right(response.data['message']);
    } on DioException catch (e) {
      return left(DioExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<Failures, String>> vertifyForgetPasswordOtp(
    String email,
    String otp,
  ) async {
    try {
      final response = await apiConsumer.post(
        ApiEndPoints.vertifyForgetPassword,
        data: {ApiKeys.email: email, ApiKeys.otpForgetPassword: otp},
      );
      return right(response.data['resetToken']); //token for rseset
    } on DioException catch (e) {
      return left(DioExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<Failures, Unit>> resetPassword(
    String email,
    String token,
    String newPassword,
    String confirmNewPassword,
  ) async {
    try {
      await apiConsumer.post(
        ApiEndPoints.resetPassword,
        data: {
          ApiKeys.email: email,
          ApiKeys.token: token,
          ApiKeys.newPassword: newPassword,
          ApiKeys.confirmNewPassword: confirmNewPassword,
        },
      );
      return right(unit); //return in real (true) but dontCare
    } on DioException catch (e) {
      return left(DioExceptions.fromDioError(e));
    }
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

  @override
  Future<Either<Failures, Unit>> confirmEmail(String email, String otp) async {
    try {
      await apiConsumer.post(
        ApiEndPoints.confirmEmail,
        data: {ApiKeys.email: email, ApiKeys.otpConfirmEmail: otp},
      );
      return right(unit);
    } on DioException catch (e) {
      return left(DioExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<Failures, Unit>> resendConfirmEmail(String email) async {
    try {
      await apiConsumer.post(
        ApiEndPoints.resendConfirmEmail,
        data: {ApiKeys.email: email},
      );
      return right(unit);
    } on DioException catch (e) {
      return left(DioExceptions.fromDioError(e));
    }
  }

  @override
  Future<void> logout() async {
    await CacheHelper.removeData(key: 'token');
    await CacheHelper.removeData(key: 'refreshToken');
  }
}
