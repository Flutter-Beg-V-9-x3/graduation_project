import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/common/widgets/divider.dart';
import 'package:flutter_graduation_project/core/common/widgets/social_sing_up.dart';
import 'package:flutter_graduation_project/features/auth/Presentation/ui/widget/auth_switch_text.dart';
import 'package:flutter_graduation_project/features/auth/Presentation/ui/widget/create_account_section.dart';
import 'package:flutter_graduation_project/features/auth/Presentation/ui/widget/sing_up_form.dart';

import '../../../../../core/navigation/navigation_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                AuthSwitchText(
                  normalText: "Already have an account?",
                  buttonText: "Log in",
                  onPressed: () {
                    NavigationManager.pop();
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
