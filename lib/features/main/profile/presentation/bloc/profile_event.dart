import '../../data/model/profile_model.dart';

abstract class ProfileEvent {}


class UpdateProfileEvent extends ProfileEvent {
  final ProfileModel profile;

  UpdateProfileEvent(this.profile);
}