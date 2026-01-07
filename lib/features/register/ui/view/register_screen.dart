import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/common/widgets/divider.dart';
import 'package:flutter_graduation_project/common/widgets/social_sing_up.dart';
import 'package:flutter_graduation_project/features/register/ui/widgets/already_have_account.dart';
import 'package:flutter_graduation_project/features/register/ui/widgets/create_account_section.dart';
import 'package:flutter_graduation_project/features/register/ui/widgets/sing_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CreateAccountSection(),
                const SizedBox(height: 40),
                const SignUpForm(),
                const SizedBox(height: 30),
                const OrDivider(),
                const SizedBox(height: 60),
                SocialSignUpButtons(),
                const SizedBox(height: 20),
                AlreadyHaveAccount(
                  onTapLogin: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Placeholder()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
