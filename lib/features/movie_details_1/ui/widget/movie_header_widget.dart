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
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          GestureDetector(
            onTap: () => setState(() => isFavorite = !isFavorite),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
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
    return Wrap(
      spacing: 8,
      alignment: WrapAlignment.center,
      children: [
        _infoBadge(widget.movie.ageRating),
        _infoBadge(widget.movie.year.toString()),
        _infoBadge("${widget.movie.duration} min"),
        _infoBadge(widget.movie.language),
      ],
    );
  }

  Widget _infoBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.glassWhite10,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: AppTextStyles.movieInfoSemiBold.copyWith(
          color: Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }
}
