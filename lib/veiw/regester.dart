import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12091D),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            const Text(
              "Name",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              hint: "Your full name",
              icon: Icons.person,
            ),

            const SizedBox(height: 20),

            // Email
            const Text(
              "Email",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              hint: "name@example.com",
              icon: Icons.email,
            ),

            const SizedBox(height: 20),

            // Password
            const Text(
              "Password",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            _buildPasswordField(
              hint: "••••••••",
              icon: Icons.lock,
              isHidden: hidePassword,
              onToggle: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            ),

            const SizedBox(height: 20),

            // Confirm Password
            const Text(
              "Confirm Password",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            _buildPasswordField(
              hint: "••••••••",
              icon: Icons.refresh,
              isHidden: hideConfirmPassword,
              onToggle: () {
                setState(() {
                  hideConfirmPassword = !hideConfirmPassword;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // ===== Text Field =====
  Widget _buildTextField({
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF2A2238),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ===== Password Field =====
  Widget _buildPasswordField({
    required String hint,
    required IconData icon,
    required bool isHidden,
    required VoidCallback onToggle,
  }) {
    return TextField(
      obscureText: isHidden,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        prefixIcon: Icon(icon, color: Colors.white70),
        suffixIcon: IconButton(
          icon: Icon(
            isHidden ? Icons.visibility_off : Icons.visibility,
            color: Colors.white70,
          ),
          onPressed: onToggle,
        ),
        filled: true,
        fillColor: const Color(0xFF2A2238),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}