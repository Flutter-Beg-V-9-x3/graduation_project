import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widget/other_review_item.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';
import 'package:flutter_graduation_project/features/reviews/data/models/review_model.dart';
import 'package:flutter_graduation_project/features/reviews/logic/review_cubit.dart';
import 'package:flutter_graduation_project/features/reviews/logic/review_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ReviewsSection extends StatefulWidget {
  final MovieDetailsModel movie;

  const ReviewsSection({super.key, required this.movie});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  bool isLikeHovered = false;
  bool isEditHovered = false;
  bool isDeleteHovered = false;
  bool isOptionsHovered = false;

  int likeCount = 24;
  int visibleReviewsCount = 3;

  String currentUserEmail = "";

  ReviewModel? localUserReview;

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
    context.read<ReviewCubit>().getMovieReviews(widget.movie.id);
  }

  Future<void> _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentUserEmail = prefs.getString("email") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        if (state is ReviewsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }

        if (state is ReviewError) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              state.message,
              style: AppTextStyles.reviewContent.copyWith(color: Colors.red),
            ),
          );
        }

        if (state is ReviewsLoaded) {
          final reviews = state.reviews;

          ReviewModel? userReview = localUserReview;

          userReview ??= ReviewModel(
            id: -1,
            rating: 4,
            comment: "Write your first review...",
            approved: true,
            movieId: widget.movie.id,
            movieName: widget.movie.title,
            user: ReviewUser(id: -1, name: "You", email: "local@user.com"),
          );

          final otherReviews = reviews;

          final displayedReviews = otherReviews
              .take(visibleReviewsCount)
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: _buildUserReview(userReview),
              ),

              const SizedBox(height: 20),

              ...displayedReviews.map(
                (review) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: OtherReviewItem(review: review),
                ),
              ),

              //  Show More
              if (visibleReviewsCount < otherReviews.length)
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        visibleReviewsCount += 3;
                      });
                    },
                    child: const Text(
                      "View All Reviews",
                      style: AppTextStyles.body,
                    ),
                  ),
                ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  // ---------------------------
  // User Review Widget
  // ---------------------------
  Widget _buildUserReview(ReviewModel? review) {
    final bool hasReview = review != null && review.id != -1;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserAvatar(),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Review",
                      style: AppTextStyles.reviewUsername.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildStars(review?.rating ?? 4),
                        const SizedBox(width: 8),
                        Text(
                          hasReview ? "Recently" : "",
                          style: AppTextStyles.reviewDate.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              _buildOptionsButton(),
            ],
          ),

          const SizedBox(height: 16),

          // Review Text
          Text(
            review?.comment ?? "Write Review",
            style: AppTextStyles.reviewContent.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.6,
            ),
          ),

          const SizedBox(height: 16),

          Divider(color: AppColors.primary.withOpacity(0.1), thickness: 1),
          const SizedBox(height: 12),

          Row(
            children: [
              _buildLikeButton(),
              const Spacer(),
              _buildEditButton(hasReview: true),
              const SizedBox(width: 8),
              _buildDeleteButton(hasReview: true),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------
  // Small Widgets
  // ---------------------------

  Widget _buildUserAvatar() {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary.withOpacity(0.4)),
      ),
      alignment: Alignment.center,
      child: Text(
        "You",
        style: AppTextStyles.labelSemiBold.copyWith(
          color: AppColors.primary,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildStars(int count) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star_rounded,
          size: 14,
          color: index < count
              ? AppColors.primary
              : AppColors.textMuted.withOpacity(0.4),
        ),
      ),
    );
  }

  Widget _buildOptionsButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => isOptionsHovered = true),
      onExit: (_) => setState(() => isOptionsHovered = false),
      child: Icon(
        Icons.more_horiz,
        color: isOptionsHovered ? Colors.white : AppColors.textMuted,
        size: 22,
      ),
    );
  }

  Widget _buildLikeButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => isLikeHovered = true),
      onExit: (_) => setState(() => isLikeHovered = false),
      child: GestureDetector(
        onTap: () => setState(() => likeCount++),
        child: Row(
          children: [
            Icon(
              isLikeHovered ? Icons.thumb_up_alt : Icons.thumb_up_alt,
              size: 16,
              color: isLikeHovered
                  ? AppColors.primary
                  : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              "$likeCount",
              style: AppTextStyles.captionSmall.copyWith(
                color: isLikeHovered
                    ? AppColors.primary
                    : AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditButton({required bool hasReview}) {
    return _buildSmallActionButton(
      label: "Edit",
      icon: Icons.edit_outlined,
      isHovered: isEditHovered,
      baseColor: Colors.white.withOpacity(0.08),
      activeColor: Colors.white.withOpacity(0.15),
      textColor: Colors.white,
      onHover: (v) => setState(() => isEditHovered = v),
    );
  }

  Widget _buildDeleteButton({required bool hasReview}) {
    return _buildSmallActionButton(
      label: "Delete",
      icon: Icons.delete_outline,
      isHovered: isDeleteHovered,
      baseColor: AppColors.error.withOpacity(0.1),
      activeColor: AppColors.error.withOpacity(0.2),
      textColor: AppColors.textRed,
      onHover: (v) => setState(() => isDeleteHovered = v),
    );
  }

  Widget _buildSmallActionButton({
    required String label,
    required IconData icon,
    required bool isHovered,
    required Color baseColor,
    required Color activeColor,
    required Color textColor,
    required Function(bool) onHover,
  }) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isHovered ? activeColor : baseColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: textColor),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.buttonSmallSemiBold.copyWith(
                color: textColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
