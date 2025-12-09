class MovieDetails {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final DateTime releaseDate;
  final String director;
  final List<String> casts;
  final List<String> writers;
  final String maturityRating;
  final List<String> genres;
  final List<String> transLanguages;
  final String duration;

  MovieDetails({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.director,
    required this.casts,
    required this.writers,
    required this.maturityRating,
    required this.genres,
    required this.transLanguages,
    required this.duration,
  });
}
