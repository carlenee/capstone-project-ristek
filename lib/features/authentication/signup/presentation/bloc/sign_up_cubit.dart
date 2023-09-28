import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/sign_up_params.dart';
import '../../domain/use_cases/sign_up_use_case.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  SignUpCubit(
    this._signUpUseCase,
  ) : super(SignUpInitialState());

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(SignUpLoadingState());

    final params = SignUpParams(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );

    final res = await _signUpUseCase.execute(params);
    if (res) {
      emit(SignUpSuccessState());
    } else {
      emit(SignUpFailureState(message: "Something went wrong."));
    }
  }

  void constraintFails(String message) {
    emit(SignUpLoadingState());
    emit(SignUpFailureState(message: message));
  }
}
