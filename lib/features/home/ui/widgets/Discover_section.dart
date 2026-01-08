import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class DiscoverWidget extends StatelessWidget {
  const DiscoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // تحديد هوامش مطابقة للصورة (تباعد متساوي من الأطراف)
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 24.0,
        bottom: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // القسم الأيسر: النصوص
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome back,',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary, // لون رمادي فاتح حسب الصورة
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2), // مسافة ضيقة جداً كما في الصورة
              Text(
                'Discover',
                style: AppTextStyles.title.copyWith(
                  color: AppColors.textPrimary, // لون أبيض
                  fontSize: 28, // حجم كبير وبارز
                  fontWeight: FontWeight.w800, // خط عريض جداً (Extra Bold)
                ),
              ),
            ],
          ),

          // القسم الأيمن: الصورة الدائرية مع الإطار
          Container(
            padding: const EdgeInsets.all(2), // مسافة للإطار الأبيض الخفيف
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.borderWhite5, // إطار شفاف بنسبة 5% حسب الثيم
                width: 1.5,
              ),
            ),
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.surface,

              backgroundImage: AssetImage('assets/images/user.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
