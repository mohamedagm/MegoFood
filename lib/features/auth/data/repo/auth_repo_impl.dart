import 'package:dartz/dartz.dart';
import 'package:mego_food/core/api/api_consumer.dart';
import 'package:mego_food/core/api/api_end_points.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer apiConsumer;
  AuthRepoImpl(this.apiConsumer);
  @override
  Future<Either<Failures, void>> login(String email, String password) {
    final response = apiConsumer.post(
      ApiEndPoints.login,
      data: {ApiKeys.email: email, ApiKeys.password: password},
    );

    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, void>> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
