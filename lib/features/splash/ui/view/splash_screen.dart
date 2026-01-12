import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:flutter_graduation_project/common/widgets/main_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_graduation_project/features/login/ui/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    await Future.delayed(const Duration(seconds: 2));

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigation()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFF191022)),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white54,
                              width: 0.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.movie_filter_sharp,
                            size: 60,
                            color: Color(0xFFB985FF),
                          ),
                        ),

                        Positioned(
                          top: -6,
                          right: -6,
                          child: Container(
                            width: 25,
                            height: 31,
                            decoration: BoxDecoration(
                              color: Color(0xFFB985FF),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0xFF191022),
                              ),
                            ),
                            child: const Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Text('MovieReview', style: AppTextStyles.title),

                    const SizedBox(height: 6),

                    Text(
                      'SHARE YOUR PERSPECTIVE',
                      style: AppTextStyles.caption.copyWith(letterSpacing: 3),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  'Powered by Mohamad Al-Zoubi | Flutter Beg V.9',
                  style: AppTextStyles.caption,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
