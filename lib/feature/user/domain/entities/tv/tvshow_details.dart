class TvshowDetails {
  final int id;
  final String name;
  final String backdropPath;
  final String overview;
  final DateTime firstAirDate;
  final List<String> creators;
  final List<String> casts;
  final String maturityRating;
  final List<String> genres;
  final int noOfSeasons;
  final List<int> seasonsId;

  TvshowDetails({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.overview,
    required this.firstAirDate,
    required this.creators,
    required this.casts,
    required this.maturityRating,
    required this.genres,
    required this.noOfSeasons,
    required this.seasonsId,
  });
}
