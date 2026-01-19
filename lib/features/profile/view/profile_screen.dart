import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --- Feature Imports ---
import 'package:flutter_graduation_project/features/auth/Presentation/cubit/auth_cubit.dart';
import 'package:flutter_graduation_project/features/auth/Presentation/cubit/auth_state.dart';
import 'package:flutter_graduation_project/features/profile/widget/logout_button.dart';
import 'package:flutter_graduation_project/features/profile/widget/profile_header.dart';
import 'package:flutter_graduation_project/features/profile/widget/profile_menu_items.dart';

/// Screen that displays the user's profile information and account settings.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Default placeholder data
  String _localName = "User";
  String _localEmail = "example@mail.com";

  @override
  void initState() {
    super.initState();
    // Load cached user data from SharedPreferences when screen initializes
    _loadCachedUserData();
  }

  /// Fetches user data stored locally on the device (SharedPreferences).
  /// This ensures data is visible even if the Bloc state isn't ready yet.
  Future<void> _loadCachedUserData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Check if the widget is still in the tree before calling setState
    if (!mounted) return;

    setState(() {
      _localName = prefs.getString("name") ?? "User";
      _localEmail = prefs.getString("email") ?? "example@mail.com";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            // Determine which data to show:
            // 1. If Bloc has 'LoginSuccess', use the fresh data from state.
            // 2. Otherwise, fallback to '_localName' loaded from SharedPreferences.
            
            final displayName = (state is LoginSuccess) ? state.user.name : _localName;
            final displayEmail = (state is LoginSuccess) ? state.user.email : _localEmail;

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: Column(
                children: [
                  // --- Header Section (Avatar, Name, Email) ---
                  ProfileHeader(
                    name: displayName,
                    email: displayEmail,
                  ),

                  const SizedBox(height: 24),

                  // --- Menu Items (Settings, Edit Profile, etc.) ---
                  const ProfileMenuItems(),

                  const SizedBox(height: 24),

                  // --- Logout Action ---
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