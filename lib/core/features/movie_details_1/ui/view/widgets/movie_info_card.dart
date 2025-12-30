import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class MovieInfoCard extends StatelessWidget {
  const MovieInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight * 0.5;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: imageHeight * 0.5,
      margin: EdgeInsets.only(
        top: imageHeight * 0.3,
        left: screenWidth * 0.03,
        right: screenWidth * 0.03,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff131317).withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: imageHeight * 0.42,
            width: screenWidth * 0.20,
            margin: EdgeInsets.only(
              top: imageHeight * 0.05,
              left: screenWidth * 0.03,
              right: screenWidth * 0.03,
            ),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/1.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Interstellar', style: AppTextStyles.movieTitle),
                SizedBox(height: 8),
                Text(
                  '2014 • Sci-Fi • Drama',
                  style: AppTextStyles.movieInfoSemiBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
