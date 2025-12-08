// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowModel _$TvShowModelFromJson(Map<String, dynamic> json) => TvShowModel(
  adult_: json['adult_'] as bool?,
  backdropPath_: json['backdrop_path'] as String?,
  genreIds_: (json['genre_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  id_: (json['id_'] as num?)?.toInt(),
  originCountry_: (json['origin_country'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  originalLanguage_: json['original_language'] as String?,
  originalName_: json['original_name'] as String?,
  overview_: json['overview_'] as String?,
  popularity_: (json['popularity_'] as num?)?.toDouble(),
  posterPath_: json['poster_path'] as String?,
  firstAirDate_: json['first_air_date'] as String?,
  name_: json['name_'] as String?,
  voteAverage_: (json['vote_average'] as num?)?.toDouble(),
  voteCount_: (json['vote_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$TvShowModelToJson(TvShowModel instance) =>
    <String, dynamic>{
      'adult_': instance.adult_,
      'backdrop_path': instance.backdropPath_,
      'genre_ids': instance.genreIds_,
      'id_': instance.id_,
      'origin_country': instance.originCountry_,
      'original_language': instance.originalLanguage_,
      'original_name': instance.originalName_,
      'overview_': instance.overview_,
      'popularity_': instance.popularity_,
      'poster_path': instance.posterPath_,
      'first_air_date': instance.firstAirDate_,
      'name_': instance.name_,
      'vote_average': instance.voteAverage_,
      'vote_count': instance.voteCount_,
    };
