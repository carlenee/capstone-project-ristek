
abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class EditProfileSuccess extends ProfileState {
  final String message;

  const EditProfileSuccess({required this.message});
}

class ProfileError extends ProfileState {
  final String error;

  const ProfileError(this.error);
}
