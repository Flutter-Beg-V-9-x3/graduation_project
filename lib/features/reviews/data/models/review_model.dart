class ReviewModel {
  final int id;
  final int rating;
  final String comment;
  final bool approved;
  final int movieId;
  final String movieName;
  final ReviewUser user;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.approved,
    required this.movieId,
    required this.movieName,
    required this.user,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? 0,
      rating: json['rating'] is int
          ? json['rating']
          : int.tryParse(json['rating'].toString()) ?? 0,
      comment: json['comment']?.toString() ?? "",
      approved: json['approved'] == 1 || json['approved'] == true,
      movieId: json['movie_id'] ?? 0,
      movieName: json['movie_name']?.toString() ?? "",
      user: ReviewUser.fromJson(json['user'] ?? {}),
    );
  }
}

class ReviewUser {
  final int id;
  final String name;
  final String email;

  ReviewUser({required this.id, required this.name, required this.email});

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? "Unknown",
      email: json['email']?.toString() ?? "",
    );
  }
}
