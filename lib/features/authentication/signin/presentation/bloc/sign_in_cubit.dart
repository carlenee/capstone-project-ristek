import 'package:capstone_project/services/shared_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/use_cases/sign_in_params.dart';
import '../../domain/use_cases/sign_in_use_case.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;
  SignInCubit(
    this._signInUseCase,
  ) : super(SignInInitialState());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());

    final params = SignInParams(
      email: email,
      password: password,
    );

    final res = await _signInUseCase.execute(params);
    res.fold(
      (fail) {
        emit(SignInFailureState(
            message: fail.message ?? "Something went wrong."));
      },
      (data) async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('firstName', data.firstName);
        prefs.setString('lastName', data.lastName);
        prefs.setString('bio', data.bio ?? "");
        SharedPreferencesService.saveToken(data.token);

        emit(SignInSuccessState());
      },
    );
  }

  void constraintFails(String message) {
    emit(SignInLoadingState());
    emit(SignInFailureState(message: message));
  }
}
