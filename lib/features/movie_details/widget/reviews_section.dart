import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --- Core Imports ---
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

// --- Feature Imports ---
import 'package:flutter_graduation_project/features/movie_details/widget/other_review_item.dart';
import 'package:flutter_graduation_project/features/movies/data/models/movie_details_model.dart';
import 'package:flutter_graduation_project/features/reviews/Presentation/cubit/review_cubit.dart';
import 'package:flutter_graduation_project/features/reviews/Presentation/cubit/review_state.dart';
import 'package:flutter_graduation_project/features/reviews/Presentation/ui/view/review_screen.dart';
import 'package:flutter_graduation_project/features/reviews/data/models/review_model.dart';

/// A section widget that displays the current user's review (if any)
/// and a list of reviews from other users.
class ReviewsSection extends StatefulWidget {
  final MovieDetailsModel movie;

  const ReviewsSection({super.key, required this.movie});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  // Local state for UI interactions
  int likeCount = 24; // Mock data for likes
  int visibleReviewsCount = 3; // Pagination control

  // User details fetched from SharedPreferences
  String currentUserEmail = "";
  String currentUserName = "";

  @override
  void initState() {
    super.initState();
    _initUserAndLoadReviews();
  }

  /// Loads user info from local storage and fetches reviews from the Cubit.
  Future<void> _initUserAndLoadReviews() async {
    final prefs = await SharedPreferences.getInstance();

    currentUserEmail = (prefs.getString("email") ?? "").trim();
    currentUserName = (prefs.getString("name") ?? "").trim();

    if (!mounted) return;

    // Trigger the Cubit to load reviews specific to this movie and user
    context.read<ReviewCubit>().loadReviewsWithUser(
          movieId: widget.movie.id,
          userName: currentUserName,
          userEmail: currentUserEmail,
        );
  }

  /// Navigate to ReviewScreen to Create or Edit a review.
  Future<void> _navigateToReviewScreen({
    int? reviewId,
    int? initialRating,
    String? initialComment,
  }) async {
    final updated = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          // Pass the existing Cubit to the new screen
          value: context.read<ReviewCubit>(),
          child: ReviewScreen(
            movieId: widget.movie.id,
            movieTitle: widget.movie.title,
            moviePoster: widget.movie.posterUrl,
            movieInfo: "${widget.movie.year} • ${widget.movie.genreName ?? ''}",
            
            // If reviewId is provided, it's Edit Mode. Otherwise, Create Mode.
            reviewId: reviewId,
            initialRating: initialRating,
            initialComment: initialComment,
          ),
        ),
      ),
    );

    // If the review was submitted/updated, refresh the list.
    if (updated == true && mounted) {
      context.read<ReviewCubit>().loadReviewsWithUser(
            movieId: widget.movie.id,
            userName: currentUserName,
            userEmail: currentUserEmail,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        // 1. Loading State
        if (state is ReviewsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }

        // 2. Error State
        if (state is ReviewError) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              state.message,
              style: AppTextStyles.reviewContent.copyWith(color: Colors.red),
            ),
          );
        }

        // 3. Success State
        if (state is ReviewsWithUserLoaded) {
          final reviews = state.reviews;
          final userReview = state.userReview;

          // Filter out the user's review from the "Other Reviews" list
          final otherReviews = userReview == null
              ? reviews
              : reviews.where((r) => r.id != userReview.id).toList();

          // Apply pagination logic
          final displayedReviews =
              otherReviews.take(visibleReviewsCount).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Current User's Review Section ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: _buildUserReviewCard(userReview),
              ),

              const SizedBox(height: 20),

              // --- Other Users' Reviews Section ---
              ...displayedReviews.map(
                (review) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: OtherReviewItem(review: review),
                ),
              ),

              // --- "View All" Button ---
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

  // -------------------------------------------------------------------
  // UI BUILDER METHODS
  // -------------------------------------------------------------------

  /// Builds the card for the logged-in user.
  /// If [review] is null, it shows a placeholder encouraging the user to write one.
  Widget _buildUserReviewCard(ReviewModel? review) {
    final bool hasReview = review != null;

    // Create a temporary model for display if no review exists
    final displayReview = review ??
        ReviewModel(
          id: -1, // Invalid ID to indicate placeholder
          rating: 0, // 0 stars for placeholder
          comment: "Write your first review...",
          approved: true,
          movieId: widget.movie.id,
          movieName: widget.movie.title,
          user: ReviewUser(
            id: -1,
            name: currentUserName.isEmpty ? "You" : currentUserName,
            email: currentUserEmail,
          ),
        );

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
          // --- Header (Avatar, Name, Date) ---
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
                      style: AppTextStyles.reviewUsername.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildStars(displayReview.rating),
                        const SizedBox(width: 8),
                        if (hasReview)
                          Text(
                            "Recently",
                            style: AppTextStyles.reviewDate.copyWith(fontSize: 12),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: AppColors.textMuted, size: 22),
            ],
          ),

          const SizedBox(height: 16),

          // --- Comment Body ---
          Text(
            displayReview.comment,
            style: AppTextStyles.reviewContent.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.6,
            ),
          ),

          const SizedBox(height: 16),
          Divider(color: AppColors.primary.withOpacity(0.1), thickness: 1),
          const SizedBox(height: 12),

          // --- Action Buttons (Like, Edit, Delete) ---
          Row(
            children: [
              // Like Button (Demo Logic)
              GestureDetector(
                onTap: () => setState(() => likeCount++),
                child: Row(
                  children: [
                    const Icon(
                      Icons.thumb_up_alt,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "$likeCount",
                      style: AppTextStyles.captionSmall.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(),

              // Edit Button
              GestureDetector(
                onTap: () {
                  // If hasReview is false, we are creating a new one (pass null IDs)
                  // If true, we pass existing data for editing.
                  _navigateToReviewScreen(
                    reviewId: hasReview ? review.id : null,
                    initialRating: hasReview ? review.rating : 0,
                    initialComment: hasReview ? review.comment : null,
                  );
                },
                child: _buildActionButton(
                  hasReview ? "Edit" : "Write", 
                  hasReview ? Icons.edit_outlined : Icons.create, 
                  Colors.white,
                ),
              ),

              // Delete Button (Only visible if review exists)
              if (hasReview) ...[
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // TODO: Implement Delete Logic here using ReviewCubit
                    // context.read<ReviewCubit>().deleteReview(review.id);
                  },
                  child: _buildActionButton(
                    "Delete",
                    Icons.delete_outline,
                    AppColors.textRed,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  // --- Helper Components ---

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

  Widget _buildActionButton(String label, IconData icon, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
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
    );
  }
}