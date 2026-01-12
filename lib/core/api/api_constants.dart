class ApiConstants {
  static const String baseUrl = "https://movie-platform.focal-x.com";

  // Auth
  static const String register = "$baseUrl/api/register";
  static const String login = "$baseUrl/api/login";
  static const String logout = "$baseUrl/api/logout";

  // Movies
  static const String movies = "$baseUrl/api/movies";

  // Reviews (dynamic endpoints)
  static String movieReviews(int movieId) =>
      "$baseUrl/api/movies/$movieId/reviews";

  static String reviewDetails(int movieId, int reviewId) =>
      "$baseUrl/api/movies/$movieId/reviews/$reviewId";
}
