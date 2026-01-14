class MovieDetailsModel {
  final int id;
  final String title;
  final int genreId;
  final String genreName;
  final int year;
  final int duration;
  final String language;
  final String posterUrl;
  final String description;
  final String trailerUrl;
  final String ageRating;

  const MovieDetailsModel({
    required this.id,
    required this.title,
    required this.genreId,
    required this.genreName,
    required this.year,
    required this.duration,
    required this.language,
    required this.posterUrl,
    required this.description,
    required this.trailerUrl,
    required this.ageRating,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      genreId: json['genre_id'],
      genreName: json['genre_name'] ?? "Unknown",
      year: json['year'],
      duration: json['duration'],
      language: json['language'],
      posterUrl: json['poster_url'],
      description: json['description'],
      trailerUrl: json['trailer_url'],
      ageRating: json['age_rating'],
    );
  }
}
