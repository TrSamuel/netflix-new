import 'package:json_annotation/json_annotation.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Movie {
  bool? adult_;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath_;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds_;
  int? id_;
  @JsonKey(name: 'original_language')
  String? originalLanguage_;
  @JsonKey(name: 'original_title')
  String? originalTitle_;
  String? overview_;
  double? popularity_;
  @JsonKey(name: 'poster_path')
  String? posterPath_;
  @JsonKey(name: 'release_date')
  String? releaseDate_;
  String? title_;
  bool? video_;
  @JsonKey(name: 'vote_average')
  double? voteAverage_;
  @JsonKey(name: 'vote_count')
  int? voteCount_;

  MovieModel({
    this.adult_,
    this.backdropPath_,
    this.genreIds_,
    this.id_,
    this.originalLanguage_,
    this.originalTitle_,
    this.overview_,
    this.popularity_,
    this.posterPath_,
    this.releaseDate_,
    this.title_,
    this.video_,
    this.voteAverage_,
    this.voteCount_,
  }) : super(
         id: id_ ?? 0,
         title: title_ ?? '',
         posterPath: posterPath_ ?? '',
         backdropPath: backdropPath_ ?? '',
         overview: overview_ ?? '',
         releaseDate: releaseDate_ == null
             ? DateTime.now()
             : DateTime.parse(releaseDate_),
       );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
