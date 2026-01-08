import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Name', style: AppTextStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          style: AppTextStyles.input,
          decoration: InputDecoration(
            hintText: 'Your full name',
            hintStyle: AppTextStyles.inputPlaceholder,
            prefixIcon: const Icon(Icons.person, color: Colors.white54),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 56),
            contentPadding: const EdgeInsets.symmetric(vertical: 22),
          ),
        ),
        const SizedBox(height: 24),

        const Text('Email', style: AppTextStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: AppTextStyles.input,
          decoration: InputDecoration(
            hintText: 'name@example.com',
            hintStyle: AppTextStyles.inputPlaceholder,
            prefixIcon: const Icon(Icons.mail, color: Colors.white54),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 56),
            contentPadding: const EdgeInsets.symmetric(vertical: 22),
          ),
        ),
        const SizedBox(height: 24),

        const Text('Password', style: AppTextStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: true,
          style: AppTextStyles.input,
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: AppTextStyles.inputPlaceholder,
            prefixIcon: const Icon(Icons.lock, color: Colors.white54),
            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility_off, color: Colors.white54),
              onPressed: () {},
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 56),
            contentPadding: const EdgeInsets.symmetric(vertical: 22),
          ),
        ),
        const SizedBox(height: 24),

        const Text('Confirm Password', style: AppTextStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: true,
          style: AppTextStyles.input,
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: AppTextStyles.inputPlaceholder,
            prefixIcon: const Icon(Icons.lock_reset, color: Colors.white54),
            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility_off, color: Colors.white54),
              onPressed: () {},
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 56),
            contentPadding: const EdgeInsets.symmetric(vertical: 22),
          ),
        ),

        const SizedBox(height: 32),
      ],
    );
  }
}
