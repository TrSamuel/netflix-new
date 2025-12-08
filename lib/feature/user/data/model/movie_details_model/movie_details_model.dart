import 'package:json_annotation/json_annotation.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie_details.dart';
import 'credits.dart';
import 'genre.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'release_dates.dart';
import 'spoken_language.dart';
import 'translations.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel extends MovieDetails {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath_;
  @JsonKey(name: 'belongs_to_collection')
  dynamic belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id_;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'origin_country')
  List<String>? originCountry;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview_;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? productionCountries;
  @JsonKey(name: 'release_date')
  String? releaseDate_;
  int? revenue;
  int? runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title_;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  Credits? credits;
  Translations? translations;
  @JsonKey(name: 'release_dates')
  ReleaseDates? releaseDates;

  MovieDetailsModel({
    this.adult,
    this.backdropPath_,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id_,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview_,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate_,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title_,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.credits,
    this.translations,
    this.releaseDates,
  }) : super(
         backdropPath: backdropPath_ ?? '',
         id: id_ ?? 0,
         overview: overview_ ?? '',
         releaseDate: releaseDate_ == null ? DateTime.now() : DateTime.parse(releaseDate_),
         title: title_ ?? '',
       );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
