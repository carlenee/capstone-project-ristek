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
import '../../../signin/presentation/pages/sign_in_page.dart';
import '../bloc/sign_up_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameFirstController = TextEditingController();
  final TextEditingController _nameLastController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();
  
  late final SignUpCubit _cubit;

  @override
  void initState() {
    _cubit = get<SignUpCubit>();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return CScaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<SignUpCubit, SignUpState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            nav.pushReplacement(const SignInPage());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                state is SignUpFailureState ? Center(
                  heightFactor: 2,
                  child: Text(
                    state.message,
                    style: CapstoneFontTheme.redSubtitle(),
                  ),
                ) : const Offstage(),
                Text(
                  "Nama Depan", 
                  style: CapstoneFontTheme.whiteSubtitle(), 
                ),
                const SizedBox(height: 8),
                CTextField(
                  title: "Nama depan", 
                  hint: "Masukkan nama depan", 
                  controller: _nameFirstController,
                ),
                const SizedBox(height: 16),
                Text(
                  "Nama Belakang", 
                  style: CapstoneFontTheme.whiteSubtitle(), 
                ),
                const SizedBox(height: 8),
                CTextField(
                  title: "Nama belakang", 
                  hint: "Masukkan nama belakang", 
                  controller: _nameLastController,
                ),
                const SizedBox(height: 16),
                Text(
                  "Email", 
                  style: CapstoneFontTheme.whiteSubtitle(), 
                ),
                const SizedBox(height: 8),
                CTextField(
                  title: "Email", 
                  hint: "Masukkan email", 
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                Text(
                  "Password", 
                  style: CapstoneFontTheme.whiteSubtitle(), 
                ),
                const SizedBox(height: 8),
                CTextField(
                  title: "Password", 
                  hint: "Masukkan password", 
                  controller: _passwordController, 
                  inputType: CTextFieldType.password,
                ),
                const SizedBox(height: 8),
                CTextField(
                  title: "Konfirmasi Password", 
                  hint: "Masukkan ulang password", 
                  controller: _passwordConfirmationController, 
                  inputType: CTextFieldType.password,
                ),
                const SizedBox(height: 32),
                RichText(
                  text: TextSpan(
                    text: 'Sudah Mempunyai Akun? ',
                    style: CapstoneFontTheme.whiteCaption(),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Masuk Akun',
                        style: CapstoneFontTheme.whiteCaptionLink(),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => nav.pushReplacement(const SignInPage()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CButton(
                      text: "Daftar",
                      isLoading: state is SignUpLoadingState,
                      onTap: () async {
                        if (_nameFirstController.text.isEmpty ||
                          _nameLastController.text.isEmpty ||
                          _emailController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _passwordConfirmationController.text.isEmpty) {
                          _cubit.constraintFails(
                            "Mohon semua data di-isi terlebih dahulu!");
                          return;
                        }
                        if (_passwordController.text != _passwordConfirmationController.text) {
                          _cubit.constraintFails(
                            "Password dan password konfirmasi tidak sama!");
                          return;
                        }

                        await _cubit.signUp(
                          email: _emailController.text, 
                          password: _passwordController.text, 
                          firstName: _nameFirstController.text, 
                          lastName: _nameLastController.text);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }
}