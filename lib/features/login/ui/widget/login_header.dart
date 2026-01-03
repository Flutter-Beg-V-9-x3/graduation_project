import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    /// مطابق للتصميم (≈ 36% من الشاشة)
    final double headerHeight = size.height * 0.36;

    return SizedBox(
      height: headerHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// Image
          Image.asset(
            'assets/images/login_im.png',
            fit: BoxFit.cover,
          ),

          /// Dark gradient (من تحت لفوق)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF191022),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          /// Purple overlay (خفيف جدًا)
          Container(
            color: const Color(0xFF7F13EC).withOpacity(0.04),
          ),

          /// Icon
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: headerHeight * 0.10,
              ),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFF7F13EC),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF7F13EC).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.movie_filter_outlined,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
