// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
  adult_: json['adult_'] as bool?,
  backdropPath_: json['backdrop_path'] as String?,
  genreIds_: (json['genre_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  id_: (json['id_'] as num?)?.toInt(),
  originalLanguage_: json['original_language'] as String?,
  originalTitle_: json['original_title'] as String?,
  overview_: json['overview_'] as String?,
  popularity_: (json['popularity_'] as num?)?.toDouble(),
  posterPath_: json['poster_path'] as String?,
  releaseDate_: json['release_date'] as String?,
  title_: json['title_'] as String?,
  video_: json['video_'] as bool?,
  voteAverage_: (json['vote_average'] as num?)?.toDouble(),
  voteCount_: (json['vote_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'adult_': instance.adult_,
      'backdrop_path': instance.backdropPath_,
      'genre_ids': instance.genreIds_,
      'id_': instance.id_,
      'original_language': instance.originalLanguage_,
      'original_title': instance.originalTitle_,
      'overview_': instance.overview_,
      'popularity_': instance.popularity_,
      'poster_path': instance.posterPath_,
      'release_date': instance.releaseDate_,
      'title_': instance.title_,
      'video_': instance.video_,
      'vote_average': instance.voteAverage_,
      'vote_count': instance.voteCount_,
    };
