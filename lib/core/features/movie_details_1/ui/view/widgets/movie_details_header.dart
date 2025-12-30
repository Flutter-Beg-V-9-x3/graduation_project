import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class MovieDetailsHeader extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onCancelPressed;

  const MovieDetailsHeader({
    super.key,
    required this.onBackPressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight * 0.5;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: imageHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.9),
            BlendMode.darken,
          ),
          image: const AssetImage('assets/images/unnamed.png'),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: onBackPressed,
            ),
          ),
          Positioned(
            top: 40,
            left: screenWidth / 2 - 60,
            child: const Text(
              'Write Review',
              style: AppTextStyles.sectionTitle,
            ),
          ),
          Positioned(
            top: 45,
            left: screenWidth / 2 - 200,
            child: TextButton(
              onPressed: onCancelPressed,
              child: const Text('Cancel', style: AppTextStyles.labelUppercase),
            ),
          ),
        ],
      ),
    );
  }
}
