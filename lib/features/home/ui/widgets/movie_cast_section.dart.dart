// import 'package:flutter/material.dart';
// // قم بتعديل المسارات حسب بنية ملفاتك core/...
// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/theme/app_text_styles.dart';

// class SynopsisCastSection extends StatelessWidget {
//   const SynopsisCastSection({super.key});

//   // بيانات الممثلين داخل Map بطريقة احترافية
//   final List<Map<String, String>> castMembers = const [
//     {
//       'name': 'Matthew M.',
//       'image': 'https://api.dicebear.com/7.x/avataaars/svg?seed=Matthew', // استبدلها بمسار الصورة المحلي
//       'role': 'Cooper'
//     },
//     {
//       'name': 'Anne Hathaway',
//       'image': 'https://api.dicebear.com/7.x/avataaars/svg?seed=Anne',
//       'role': 'Amelia'
//     },
//     {
//       'name': 'Jessica Ch.',
//       'image': 'https://api.dicebear.com/7.x/avataaars/svg?seed=Jessica',
//       'role': 'Murph'
//     },
//     {
//       'name': 'Timothée Ch.',
//       'image': 'https://api.dicebear.com/7.x/avataaars/svg?seed=Timothee',
//       'role': 'Young Tom'
//     },
//     {
//       'name': 'Michael Caine',
//       'image': 'https://api.dicebear.com/7.x/avataaars/svg?seed=Michael',
//       'role': 'Prof. Brand'
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // --- القسم الأول: قصة الفيلم (Synopsis) ---
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//           child: Text(
//             "Synopsis",
//             style: AppTextStyles.sectionTitle,
//           ),
//         ),
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Text(
//             "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival. As Earth faces environmental collapse, Cooper must choose between his children and the future of the human race.",
//             style: AppTextStyles.reviewContent, // حجم 14 مريح للعين
//             maxLines: 4,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),

//         const SizedBox(height: 24),

//         // --- القسم الثاني: طاقم العمل (Cast) ---
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text("Cast", style: AppTextStyles.sectionTitle),
//               Text(
//                 "View All",
//                 style: AppTextStyles.viewAll.copyWith(color: AppColors.primary),
//               ),
//             ],
//           ),
//         ),

//         // قائمة الممثلين الأفقية
//         SizedBox(
//           height: 130, // الارتفاع الكلي للعنصر
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(left: 20),
//             itemCount: castMembers.length,
//             itemBuilder: (context, index) {
//               final actor = castMembers[index];
//               return _buildCastItem(actor);
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   // ويدجيت فرعية لبناء صورة واسم الممثل
//   Widget _buildCastItem(Map<String, String> actor) {
//     return Container(
//       width: 80, // عرض العنصر
//       margin: const EdgeInsets.only(right: 16),
//       child: Column(
//         children: [
//           // الصورة الدائرية مع تأثير البوردر
//           Container(
//             padding: const EdgeInsets.all(2),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: AppColors.primary.withOpacity(0.3),
//                 width: 1,
//               ),
//             ),
//             child: CircleAvatar(
//               radius: 32,
//               backgroundColor: AppColors.surface,
//               // استخدم NetworkImage للتجربة أو AssetImage للصور المحلية
//               backgroundImage: NetworkImage(actor['image']!),
//             ),
//           ),
//           const SizedBox(height: 8),

//           // اسم الممثل
//           Text(
//             actor['name']!,
//             textAlign: TextAlign.center,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: AppTextStyles.label.copyWith(fontSize: 12),
//           ),

//           // الدور (خفيف)
//           Text(
//             actor['role']!,
//             textAlign: TextAlign.center,
//             maxLines: 1,
//             style: AppTextStyles.captionSmall.copyWith(color: AppColors.textMuted),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SynopsisCastSection extends StatelessWidget {
  const SynopsisCastSection({super.key});

  // الماب المطلوب بالأسماء الأربعة فقط كما في الصورة
  final List<Map<String, String>> castMembers = const [
    {'name': 'Matthew McC.', 'image': 'assets/images/Matthew McC.jpg'},
    {'name': 'Anne H.', 'image': 'assets/images/Anne H..jpg'},
    {'name': 'Jessica C.', 'image': 'assets/images/Jessica C..jpg'},
    {'name': 'Mackenzie F.', 'image': 'assets/images/Mackenzie F..jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // عنوان القسم Cast فقط على الزاوية
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text("Cast", style: AppTextStyles.sectionTitle),
        ),

        // قائمة الممثلين الأربعة
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            physics:
                const NeverScrollableScrollPhysics(), // لأنهم 4 فقط لا يحتاج سكرول
            itemCount: castMembers.length,
            itemBuilder: (context, index) {
              final actor = castMembers[index];
              return _buildCastItem(actor);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCastItem(Map<String, String> actor) {
    return Container(
      width: 85,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          // الصورة الدائرية
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.surface,
            backgroundImage: NetworkImage(actor['image']!),
          ),
          const SizedBox(height: 8),

          // اسم الممثل تحت الصورة
          Text(
            actor['name']!,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.label.copyWith(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
