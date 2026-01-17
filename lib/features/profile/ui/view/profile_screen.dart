import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/auth/Presentation/cubit/auth_cubit.dart';
import 'package:flutter_graduation_project/features/auth/Presentation/cubit/auth_state.dart';
import 'package:flutter_graduation_project/features/profile/ui/widget/logout_button.dart';
import 'package:flutter_graduation_project/features/profile/ui/widget/profile_header.dart';
import 'package:flutter_graduation_project/features/profile/ui/widget/profile_menu_items.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "User";
  String email = "example@mail.com";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString("name") ?? "User";
      email = prefs.getString("email") ?? "example@mail.com";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is LoginSuccess) {
              name = state.user.name;
              email = state.user.email;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                children: [
                  ProfileHeader(name: name, email: email),
                  const SizedBox(height: 24),
                  const ProfileMenuItems(),
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
