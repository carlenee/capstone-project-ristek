import 'package:capstone_project/features/authentication/signin/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constants/dictionary.dart';
import 'core/theme/_themes.dart';
import 'features/onboarding/presentation/bloc/user_initialization_bloc.dart';
import 'features/onboarding/presentation/bloc/user_initialization_event.dart';
import 'features/onboarding/presentation/bloc/user_initialization_state.dart';

import 'services/navigation.dart';

final nav = NavigationService();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          UserInitializationBloc()..add(SplashEvent()),
      child: BlocBuilder<UserInitializationBloc, UserInitializationState>(
          builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale(CapstoneDictionary.locale),
          ],
          title: 'Capstone',
          theme: ThemeData(
            scaffoldBackgroundColor: CapstoneColors.blackPrimary,
            fontFamily: CapstoneFontTheme.fontFamily,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: CapstoneColors.greySecondary,
              selectionColor: CapstoneColors.purple,
              selectionHandleColor: CapstoneColors.grey,
            ),
          ),
          navigatorKey: nav.navigatorKey,
          home: const SignInPage(),
        );
      }),
    );
  }
}
