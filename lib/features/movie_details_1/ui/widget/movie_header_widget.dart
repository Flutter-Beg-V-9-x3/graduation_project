import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_colors.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';

class HeaderWidget extends StatefulWidget {
  final MovieDetailsModel movie;

  const HeaderWidget({super.key, required this.movie});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool isFavorite = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildTopActionButtons(),
              const SizedBox(height: 15),
              _buildInteractivePoster(),
              const SizedBox(height: 20),
              Text(widget.movie.title, style: AppTextStyles.movieTitleLarge),
              const SizedBox(height: 4),
              Text(
                widget.movie.genreName,
                style: AppTextStyles.movieInfoSemiBold.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 15),
              _buildMovieInfoBadges(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.70),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),

          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.70),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              GestureDetector(
                onTap: () => setState(() => isFavorite = !isFavorite),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.70),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/unnamed.png'),
          //image: NetworkImage(widget.movie.posterUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              AppColors.background.withOpacity(0.8),
              AppColors.background,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInteractivePoster() {
    return Container(
      width: 170,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(widget.movie.posterUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMovieInfoBadges() {
    String durationText = 'N/A';
    final minutes = widget.movie.duration;
    // ignore: unnecessary_null_comparison
    if (minutes != null && minutes > 0) {
      final hours = minutes ~/ 60;
      final remainingMinutes = minutes % 60;

      final parts = <String>[];
      if (hours > 0) parts.add('${hours}h');
      if (remainingMinutes > 0) parts.add('${remainingMinutes}m');

      durationText = parts.join(' ');
    }

    return Wrap(
      spacing: 6,
      //  runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
          ),
          child: Text(
            widget.movie.ageRating,
            style: AppTextStyles.movieInfoSemiBold,
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.glassWhite10,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.calendar_month_rounded,
                size: 16,
                color: Colors.white.withOpacity(0.9),
              ),
              const SizedBox(width: 6),
              Text(
                widget.movie.year.toString(),
                style: AppTextStyles.movieInfoSemiBold,
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.glassWhite10,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.access_time_filled_rounded,
                size: 16,
                color: Colors.white.withOpacity(0.9),
              ),
              const SizedBox(width: 6),
              Text(durationText, style: AppTextStyles.movieInfoSemiBold),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.glassWhite10,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.translate_rounded,
                size: 16,
                color: Colors.white.withOpacity(0.9),
              ),
              const SizedBox(width: 6),
              Text(
                widget.movie.language,
                style: AppTextStyles.movieInfoSemiBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
