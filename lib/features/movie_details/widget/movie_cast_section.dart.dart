import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class SynopsisCastSection extends StatelessWidget {
  const SynopsisCastSection({super.key, required  MovieDetailsModel movie});

  final List<Map<String, String>> castMembers = const [
    {'name': 'Matthew McC.', 'image': 'assets/images/Matthew.jpg'},
    {'name': 'Anne H.', 'image': 'assets/images/Anne.jpg'},
    {'name': 'Jessica C.', 'image': 'assets/images/Jessica.jpg'},
    {'name': 'Mackenzie F.', 'image': 'assets/images/Mackenzie.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            physics: const NeverScrollableScrollPhysics(),
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
            backgroundImage: AssetImage(actor['image']!),
          ),
          const SizedBox(height: 8),

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
