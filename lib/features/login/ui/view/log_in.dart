import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/login/ui/widget/login_header.dart';


class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const LoginHeader(),

          /// باقي الصفحة
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: const [
                  SizedBox(height: 24),
                  // Welcome Text
                  // Form
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
