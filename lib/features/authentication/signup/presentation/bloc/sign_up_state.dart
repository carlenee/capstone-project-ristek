part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpFailureState extends SignUpState {
  final String message;
  SignUpFailureState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
