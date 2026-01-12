import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/auth/logic/auth_cubit.dart';
import 'package:flutter_graduation_project/features/login/ui/view/login_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ElevatedButton(
        onPressed: () async {
          //log out
          await context.read<AuthCubit>().logout();

          //Logged out successfully
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Logged out successfully"),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );

          //Go to the login page
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffbd5d71),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}