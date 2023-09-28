import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app.dart';
import '../../../../core/constants/route.dart';
import '../../../authentication/signin/presentation/pages/sign_in_page.dart';
import '../../../main/wrapper/presentation/pages/main_wrapper.dart';
import '../bloc/user_initialization_bloc.dart';
import '../bloc/user_initialization_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserInitializationBloc, UserInitializationState>(
      listener: (context, state) {
        if (state is UserIsUnauthenticated) {
          nav.splashPush(const SignInPage(), CapstoneRoute.onboarding);
        } else if (state is UserIsAuthenticated) {
          nav.splashPush(const MainWrapper());
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text('Medtech'),
        ),
      ),
    );
  }
}
