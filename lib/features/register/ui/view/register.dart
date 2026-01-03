import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/register/ui/widget/auth_switch_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AuthSwitchText(
                normalText: "Already have an account?",
                buttonText: "Log in",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
    );
  }
}