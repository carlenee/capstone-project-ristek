abstract class UserInitializationState {}

class UserInitializationInitial extends UserInitializationState {}

class UserIsUnauthenticated extends UserInitializationState {}

class UserIsAuthenticated extends UserInitializationState {}

class UserInitializationFailure extends UserInitializationState {
  final String message;

  UserInitializationFailure({required this.message});
}
