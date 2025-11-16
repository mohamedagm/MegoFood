import 'package:dartz/dartz.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/auth/data/models/success_login_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, SuccessLoginModel>> login(
    String email,
    String password,
  );
  Future<Either<Failures, SuccessLoginModel>> register(
    String email,
    String password,
  );
  Future<Either<Failures, SuccessLoginModel>> logout();
}
