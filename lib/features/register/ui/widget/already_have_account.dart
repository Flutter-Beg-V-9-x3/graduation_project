import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:flutter_graduation_project/features/register/ui/widget/auth_switch_text.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AuthSwitchText(
          normalText: 'Already have a account',
          buttonText: 'Log in',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
