// ملف: lib/features/home/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/common/widgets/custom_bottom_nav.dart';
import '../../core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // لتتبع الصفحة الحالية

  // قائمة الصفحات
  final List<Widget> _pages = [
    _buildPage('Home', Icons.home, AppColors.primary),
    _buildPage('Search', Icons.search, AppColors.textBlue),
    _buildPage('Reviews', Icons.reviews, AppColors.textGreen),
    _buildPage('Profile', Icons.person, AppColors.textPurple),
  ];

  // دالة مساعدة لإنشاء صفحة بسيطة
  static Widget _buildPage(String title, IconData icon, Color color) {
    return Container(
      color: AppColors.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: color),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة عند الضغط على زر (+)
  void _onAddPressed() {
    // هنا رح نضيف اللي بدنا ياه
    print('تم الضغط على زر الإضافة');

    // مثلاً: نعرض نافذة منبثقة
    // showDialog(...)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _pages[_currentIndex], // عرض الصفحة الحالية
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        onCenterButtonPressed: _onAddPressed,
      ),
    );
  }
}
