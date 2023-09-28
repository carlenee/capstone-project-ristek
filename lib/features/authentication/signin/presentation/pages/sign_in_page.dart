import 'package:capstone_project/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app.dart';
import '../../../../../core/bases/enum/text_field_type.dart';
import '../../../../../core/bases/widgets/atoms/button.dart';
import '../../../../../core/bases/widgets/atoms/text_field.dart';
import '../../../../../core/bases/widgets/layout/CScaffold.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/theme/_themes.dart';
import '../../../../../services/di.dart';
import '../../../signup/presentation/pages/sign_up_page.dart';
import '../bloc/sign_in_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final SignInCubit _cubit;
  @override
  void initState() {
    _cubit = get<SignInCubit>();
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return CScaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<SignInCubit, SignInState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is SignInSuccessState) {
            nav.pushReplacement(const OnboardingPage());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.ristekLogo,
                      height: 140,
                    ),
                  ),
                  const SizedBox(height: 30),
                  state is SignInFailureState ? Center(
                    heightFactor: 2,
                    child: Text(
                      state.message,
                      style: CapstoneFontTheme.redSubtitle(),
                    ),
                  ) : const Offstage(),
                  Text(
                    "Email", 
                    style: CapstoneFontTheme.whiteSubtitle(), 
                  ),
                  const SizedBox(height: 8),
                  CTextField(title: "Email", hint: "Masukkan email", controller: _emailController),
                  const SizedBox(height: 16),
                  Text(
                    "Password", 
                    style: CapstoneFontTheme.whiteSubtitle(), 
                  ),
                  const SizedBox(height: 8),
                  CTextField(title: "Password", hint: "Masukkan password", controller: _passwordController, inputType: CTextFieldType.password),
                  const SizedBox(height: 32),
                  RichText(
                    text: TextSpan(
                      text: 'Belum Memiliki Akun? ',
                      style: CapstoneFontTheme.whiteCaption(),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Buat Akun',
                          style: CapstoneFontTheme.whiteCaptionLink(),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => nav.pushReplacement(const SignUpPage()),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CButton(
                        text: "Masuk",
                        onTap: () async {
                          if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                            _cubit.constraintFails(
                              "Mohon semua data di-isi terlebih dahulu!");
                            return;
                          }

                          await _cubit.signIn(
                            email: _emailController.text, 
                            password: _passwordController.text);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}