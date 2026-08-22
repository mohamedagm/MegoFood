part of 'user_profile_cubit.dart';

sealed class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object?> get props => [];
}

final class UserProfileInitial extends UserProfileState {}

final class UserProfileLoading extends UserProfileState {}

final class UserProfileLoaded extends UserProfileState {
  final ProfileModel profile;

  const UserProfileLoaded(this.profile);

  @override
  List<Object?> get props => [profile];
}

final class UserProfileFailure extends UserProfileState {
  final String message;

  const UserProfileFailure(this.message);

  @override
  List<Object?> get props => [message];
}
