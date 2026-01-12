import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/common/widgets/divider.dart';
import 'package:flutter_graduation_project/common/widgets/main_navigation.dart';
import 'package:flutter_graduation_project/common/widgets/social_sing_up.dart';
import 'package:flutter_graduation_project/features/login/ui/widget/custom_button.dart';
import 'package:flutter_graduation_project/features/login/ui/widget/login_form.dart';
import 'package:flutter_graduation_project/features/login/ui/widget/login_header.dart';
import 'package:flutter_graduation_project/features/login/ui/widget/recovery_password.dart';
import 'package:flutter_graduation_project/features/login/ui/widget/welcome_back.dart';
import 'package:flutter_graduation_project/features/register/ui/view/register_screen.dart';
import 'package:flutter_graduation_project/features/register/ui/widget/auth_switch_text.dart';
import 'package:flutter_graduation_project/features/auth/logic/auth_cubit.dart';
import 'package:flutter_graduation_project/features/auth/logic/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const LoginHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  welcome_back(),

                  LoginForm(
                    formKey: _formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [RecoveryPassword()],
                  ),

                  const SizedBox(height: 18),

                  /// ---------------- BlocConsumer ---------------- ///
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }

                      if (state is LoginSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Logged in successfully!"),
                            backgroundColor: Colors.green,
                          ),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainNavigation(),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          formKey: _formKey,
                          text: state is AuthLoading ? "Loading..." : "Log In",
                          onPressedAsync: () async {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),

                  /// -------------------------------------------------- ///
                  const SizedBox(height: 16),

                  const OrDivider(),
                  const SizedBox(height: 16),

                  SocialSignUpButtons(),
                  const SizedBox(height: 16),

                  AuthSwitchText(
                    normalText: "Don't have an account?",
                    buttonText: "Sign Up",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}