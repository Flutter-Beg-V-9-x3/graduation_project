// import 'package:flutter/material.dart';
// import 'package:flutter_graduation_project/core/theme/app_colors.dart';

// class CustomCircleButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//   final Color? iconColor;

//   const CustomCircleButton({
//     super.key,
//     required this.icon,
//     required this.onTap,
//     this.iconColor = Colors.white,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: const BoxDecoration(
//           color: AppColors.glassBlack40, // تأثير الزجاج الأسود الشفاف
//           shape: BoxShape.circle,
//         ),
//         child: Icon(icon, color: iconColor, size: 20),
//       ),
//     );
//   }
// }
