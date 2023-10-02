import 'package:capstone_project/features/main/profile/data/repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<UpdateProfileEvent>(_updateProfile);
  }


  Future<void> _updateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());


    final result = await ProfileRepository.editProfile(event.profile);

    result.fold(
      (failure) {
        emit(ProfileError(failure.message));
      },
      (updatedProfile) {
        emit(EditProfileSuccess(message: updatedProfile));
      },
    );
  }
}
