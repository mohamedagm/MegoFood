import 'package:dartz/dartz.dart';
import 'package:mego_food/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failures, void>> login(String email, String password);
  Future<Either<Failures, void>> register(String email, String password);
  Future<Either<Failures, void>> logout();
}
