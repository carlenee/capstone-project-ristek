import 'dart:async';

import 'package:capstone_project/features/onboarding/presentation/bloc/user_initialization_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:capstone_project/services/shared_preferences.dart';

import 'user_initialization_bloc.dart';
import 'user_initialization_state.dart';

class UserInitializationBloc
    extends Bloc<UserInitializationEvent, UserInitializationState> {
  UserInitializationBloc() : super(UserInitializationInitial()) {
    on<SplashEvent>(_splashEvent);
  }

  FutureOr<void> _splashEvent(
    SplashEvent event,
    Emitter<UserInitializationState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    if (await SharedPreferencesService.containsToken()) {
      emit(UserIsAuthenticated());
    } else {
      emit(UserIsUnauthenticated());
    }
  }
}
