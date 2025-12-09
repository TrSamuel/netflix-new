import 'package:json_annotation/json_annotation.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv/tvshow_details.dart';

import 'content_ratings.dart';
import 'created_by.dart';
import 'credits.dart';
import 'genre.dart';
import 'last_episode_to_air.dart';
import 'network.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'season.dart';
import 'spoken_language.dart';

part 'tv_show_details_model.g.dart';

@JsonSerializable()
class TvShowDetailsModel extends TvshowDetails {
  bool? adult_;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath_;
  @JsonKey(name: 'created_by')
  List<CreatedBy>? createdBy_;
  @JsonKey(name: 'episode_run_time')
  List<dynamic>? episodeRunTime_;
  @JsonKey(name: 'first_air_date')
  String? firstAirDate_;
  List<Genre>? genres_;
  String? homepage_;
  int? id_;
  @JsonKey(name: 'in_production')
  bool? inProduction_;
  List<String>? languages_;
  @JsonKey(name: 'last_air_date')
  String? lastAirDate_;
  @JsonKey(name: 'last_episode_to_air')
  LastEpisodeToAir? lastEpisodeToAir_;
  String? name_;
  @JsonKey(name: 'next_episode_to_air')
  dynamic nextEpisodeToAir_;
  List<Network>? networks_;
  @JsonKey(name: 'number_of_episodes')
  int? numberOfEpisodes_;
  @JsonKey(name: 'number_of_seasons')
  int? numberOfSeasons_;
  @JsonKey(name: 'origin_country')
  List<String>? originCountry_;
  @JsonKey(name: 'original_language')
  String? originalLanguage_;
  @JsonKey(name: 'original_name')
  String? originalName_;
  String? overview_;
  double? popularity_;
  @JsonKey(name: 'poster_path')
  String? posterPath_;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? productionCompanies_;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? productionCountries_;
  List<Season>? seasons_;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? spokenLanguages_;
  String? status_;
  String? tagline_;
  String? type_;
  @JsonKey(name: 'vote_average')
  double? voteAverage_;
  @JsonKey(name: 'vote_count')
  int? voteCount_;
  Credits? credits_;
  @JsonKey(name: 'content_ratings')
  ContentRatings? contentRatings_;

  TvShowDetailsModel({
    this.adult_,
    this.backdropPath_,
    this.createdBy_,
    this.episodeRunTime_,
    this.firstAirDate_,
    this.genres_,
    this.homepage_,
    this.id_,
    this.inProduction_,
    this.languages_,
    this.lastAirDate_,
    this.lastEpisodeToAir_,
    this.name_,
    this.nextEpisodeToAir_,
    this.networks_,
    this.numberOfEpisodes_,
    this.numberOfSeasons_,
    this.originCountry_,
    this.originalLanguage_,
    this.originalName_,
    this.overview_,
    this.popularity_,
    this.posterPath_,
    this.productionCompanies_,
    this.productionCountries_,
    this.seasons_,
    this.spokenLanguages_,
    this.status_,
    this.tagline_,
    this.type_,
    this.voteAverage_,
    this.voteCount_,
    this.credits_,
    this.contentRatings_,
  }) : super(
         backdropPath: backdropPath_ ?? '',
         casts: credits_?.cast != null ? credits_!.cast!.map((c) => c.name ?? '').toList() : [],
         creators: createdBy_ != null ? createdBy_.map((cr) => cr.name ?? '').toList() : [],
         firstAirDate: firstAirDate_ == null ? DateTime.now() : DateTime.parse(firstAirDate_),
         genres: genres_ != null ? genres_.map((g) => g.name ?? '').toList() : [],
         id: id_ ?? 0,
         name: name_ ?? '',
         overview: overview_ ?? '',
         maturityRating: contentRatings_?.results != null
             ? (contentRatings_!.results!.first.rating!)
             : '',
         noOfSeasons: numberOfSeasons_ ?? 0,
         seasonsId: seasons_ != null ? seasons_.map((s) => s.id ?? 0).toList() : [],
       );

  factory TvShowDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$TvShowDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TvShowDetailsModelToJson(this);
}
