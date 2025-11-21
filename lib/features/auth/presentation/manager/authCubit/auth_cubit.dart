import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/auth/data/models/success_login_model.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial()); //will Pass Repo Impl
  final AuthRepoImpl authRepo;
  Future<void> loginC({required String email, required String password}) async {
    emit(AuthLoading());
    final result = await authRepo.login(email, password);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (successLoginModel) => emit(AuthLoginSuccess(successLoginModel)),
    );
  }

  Future<void> registerC({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await authRepo.register(email, password);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (unit) => emit(AuthRegisterSuccess()),
    );
  }

  Future<void> forgetPasswordC({required String email}) async {
    emit(AuthLoading());
    final result = await authRepo.forgetPassword(email);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (unit) => emit(AuthForgetPassword()),
    );
  }

  Future<void> vertifyForgetPasswordOtpC({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading());
    final result = await authRepo.vertifyForgetPasswordOtp(email, otp);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (resetToken) => emit(AuthVertifyForgetPasswordOtp(resetToken)),
    );
  }
}
