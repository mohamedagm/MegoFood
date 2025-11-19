part of 'auth_cubit.dart';

@immutable
sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final SuccessLoginModel successLoginModel;

  AuthSuccess(this.successLoginModel);

  @override
  List<Object?> get props => [successLoginModel];
}

final class AuthFailure extends AuthState {
  final Failures failure;

  AuthFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
