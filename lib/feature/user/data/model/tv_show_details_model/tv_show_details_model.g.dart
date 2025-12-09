// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowDetailsModel _$TvShowDetailsModelFromJson(Map<String, dynamic> json) => TvShowDetailsModel(
  adult_: json['adult'] as bool?,
  backdropPath_: json['backdrop_path'] as String?,
  createdBy_: (json['created_by'] as List<dynamic>?)
      ?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>))
      .toList(),
  episodeRunTime_: json['episode_run_time'] as List<dynamic>?,
  firstAirDate_: json['first_air_date'] as String?,
  genres_: (json['genres'] as List<dynamic>?)
      ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  homepage_: json['homepage'] as String?,
  id_: (json['id'] as num?)?.toInt(),
  inProduction_: json['in_production'] as bool?,
  languages_: (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList(),
  lastAirDate_: json['last_air_date'] as String?,
  lastEpisodeToAir_: json['last_episode_to_air'] == null
      ? null
      : LastEpisodeToAir.fromJson(json['last_episode_to_air'] as Map<String, dynamic>),
  name_: json['name'] as String?,
  nextEpisodeToAir_: json['next_episode_to_air'],
  networks_: (json['networks'] as List<dynamic>?)
      ?.map((e) => Network.fromJson(e as Map<String, dynamic>))
      .toList(),
  numberOfEpisodes_: (json['number_of_episodes'] as num?)?.toInt(),
  numberOfSeasons_: (json['number_of_seasons'] as num?)?.toInt(),
  originCountry_: (json['origin_country'] as List<dynamic>?)?.map((e) => e as String).toList(),
  originalLanguage_: json['original_language'] as String?,
  originalName_: json['original_name'] as String?,
  overview_: json['overview'] as String?,
  popularity_: (json['popularity'] as num?)?.toDouble(),
  posterPath_: json['poster_path'] as String?,
  productionCompanies_: (json['production_companies'] as List<dynamic>?)
      ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
      .toList(),
  productionCountries_: (json['production_countries'] as List<dynamic>?)
      ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
      .toList(),
  seasons_: (json['seasons'] as List<dynamic>?)
      ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
      .toList(),
  spokenLanguages_: (json['spoken_languages'] as List<dynamic>?)
      ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
      .toList(),
  status_: json['status'] as String?,
  tagline_: json['tagline'] as String?,
  type_: json['type'] as String?,
  voteAverage_: (json['vote_average'] as num?)?.toDouble(),
  voteCount_: (json['vote_count'] as num?)?.toInt(),
  credits_: json['credits'] == null
      ? null
      : Credits.fromJson(json['credits'] as Map<String, dynamic>),
  contentRatings_: json['content_ratings'] == null
      ? null
      : ContentRatings.fromJson(json['content_ratings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TvShowDetailsModelToJson(TvShowDetailsModel instance) => <String, dynamic>{
  'adult': instance.adult_,
  'backdrop_path': instance.backdropPath_,
  'created_by': instance.createdBy_,
  'episode_run_time': instance.episodeRunTime_,
  'first_air_date': instance.firstAirDate_,
  'genres': instance.genres_,
  'homepage': instance.homepage_,
  'id': instance.id_,
  'in_production': instance.inProduction_,
  'languages': instance.languages_,
  'last_air_date': instance.lastAirDate_,
  'last_episode_to_air': instance.lastEpisodeToAir_,
  'name': instance.name_,
  'next_episode_to_air': instance.nextEpisodeToAir_,
  'networks': instance.networks_,
  'number_of_episodes': instance.numberOfEpisodes_,
  'number_of_seasons': instance.numberOfSeasons_,
  'origin_country': instance.originCountry_,
  'original_language': instance.originalLanguage_,
  'original_name': instance.originalName_,
  'overview': instance.overview_,
  'popularity': instance.popularity_,
  'poster_path': instance.posterPath_,
  'production_companies': instance.productionCompanies_,
  'production_countries': instance.productionCountries_,
  'seasons': instance.seasons_,
  'spoken_languages': instance.spokenLanguages_,
  'status': instance.status_,
  'tagline': instance.tagline_,
  'type': instance.type_,
  'vote_average': instance.voteAverage_,
  'vote_count': instance.voteCount_,
  'credits': instance.credits_,
  'content_ratings': instance.contentRatings_,
};
