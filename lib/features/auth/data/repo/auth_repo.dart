import 'package:dartz/dartz.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/auth/data/models/success_login_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, SuccessLoginModel>> login(
    String email,
    String password,
  );
  Future<Either<Failures, Unit>> forgetPassword(String email);
  Future<Either<Failures, String>> vertifyForgetPasswordOtp(
    String email,
    String otp,
  );
  Future<Either<Failures, Unit>> resetPassword(
    String email,
    String token,
    String newPassword,
    String confirmNewPassword,
  );
  Future<Either<Failures, Unit>> register(String email, String password);
  Future<Either<Failures, Unit>> confirmEmail(String email, String otp);
  Future<Either<Failures, Unit>> resendConfirmEmail(String email);

  Future<Either<Failures, SuccessLoginModel>> logout();
}
