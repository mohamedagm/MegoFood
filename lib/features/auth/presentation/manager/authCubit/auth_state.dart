part of 'auth_cubit.dart';

@immutable
sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {
  final SuccessLoginModel successLoginModel;

  AuthLoginSuccess(this.successLoginModel);

  @override
  List<Object?> get props => [successLoginModel];
}

final class AuthRegisterSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final Failures failure;

  AuthFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
