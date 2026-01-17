import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/auth/Presentation/cubit/auth_cubit.dart';
import 'package:flutter_graduation_project/features/auth/Presentation/cubit/auth_state.dart';
import 'package:flutter_graduation_project/features/profile/ui/widget/logout_button.dart';
import 'package:flutter_graduation_project/features/profile/ui/widget/profile_header.dart';
import 'package:flutter_graduation_project/features/profile/ui/widget/profile_menu_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            String name = "User";
            String email = "example@mail.com";

            if (state is LoginSuccess) {
              name = state.user.name ?? "User";
              email = state.user.email ?? "example@mail.com";
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                children: [
                  ProfileHeader(name: name, email: email),
                  const SizedBox(height: 24),
                  const ProfileMenuItems(),
                  //const Spacer(),
                  const SizedBox(height: 24),
                  const LogoutButton(),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}