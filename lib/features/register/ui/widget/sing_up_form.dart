import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // متغيرات للتحكم بحالة إظهار/إخفاء كلمة السر
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
          obscureText: _obscurePassword, // مرتبط بالمتغير
          style: AppTextStyles.input,
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: AppTextStyles.inputPlaceholder,
            prefixIcon: const Icon(Icons.lock, color: Colors.white54),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.white54,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword; // تبديل الحالة
                });
              },
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
          obscureText: _obscureConfirmPassword, // مرتبط بالمتغير الثاني
          style: AppTextStyles.input,
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: AppTextStyles.inputPlaceholder,
            prefixIcon: const Icon(Icons.lock_reset, color: Colors.white54),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.white54,
              ),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword =
                      !_obscureConfirmPassword; // تبديل الحالة
                });
              },
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
