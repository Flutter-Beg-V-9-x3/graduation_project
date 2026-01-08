import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/profile/ui/widget/logout_button.dart';
import 'package:flutter_graduation_project/features/profile/ui/widget/profile_header.dart';
import 'package:flutter_graduation_project/features/profile/ui/widget/profile_menu_items.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              const ProfileHeader(name: 'X3', email: 'flutterBeg@gmail.com'),
              const SizedBox(height: 24),
              const ProfileMenuItems(),
              // const Spacer(),
              const SizedBox(height: 24),
              LogoutButton(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}


