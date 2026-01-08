import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Name', style: AppTextStyles.label),
          const SizedBox(height: 8),
          TextFormField(
            controller: _nameController,
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
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال اسمك الكامل';
              }
              if (value.trim().length < 3) {
                return 'الاسم يجب أن يكون 3 أحرف على الأقل';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          const Text('Email', style: AppTextStyles.label),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
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
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              }
              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (!emailRegex.hasMatch(value.trim())) {
                return 'الرجاء إدخال بريد إلكتروني صحيح';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          const Text('Password', style: AppTextStyles.label),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
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
                    _obscurePassword = !_obscurePassword;
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال كلمة المرور';
              }
              if (value.length < 8) {
                return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          const Text('Confirm Password', style: AppTextStyles.label),
          const SizedBox(height: 8),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscureConfirmPassword,
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
                    _obscureConfirmPassword = !_obscureConfirmPassword;
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء تأكيد كلمة المرور';
              }
              if (value != _passwordController.text) {
                return 'كلمتا المرور غير متطابقتين';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }
}
