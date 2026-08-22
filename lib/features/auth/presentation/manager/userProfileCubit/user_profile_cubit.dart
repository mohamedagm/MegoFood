import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mego_food/features/auth/data/models/profile_model.dart';
import 'package:mego_food/features/auth/data/repo/auth_repo_impl.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.authRepo) : super(UserProfileInitial());

  final AuthRepoImpl authRepo;

  Future<void> loadProfile() async {
    emit(UserProfileLoading());
    final result = await authRepo.getProfile();
    result.fold(
      (failure) => emit(UserProfileFailure(failure.message)),
      (profile) => emit(UserProfileLoaded(profile)),
    );
  }

  void setProfile(ProfileModel profile) => emit(UserProfileLoaded(profile));
}
