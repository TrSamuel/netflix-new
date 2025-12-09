import 'package:json_annotation/json_annotation.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv/tv_show.dart';

part 'tv_show_model.g.dart';

@JsonSerializable()
class TvShowModel extends Tvshow {
  bool? adult_;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath_;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds_;
  int? id_;
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
  @JsonKey(name: 'first_air_date')
  String? firstAirDate_;
  String? name_;
  @JsonKey(name: 'vote_average')
  double? voteAverage_;
  @JsonKey(name: 'vote_count')
  int? voteCount_;

  TvShowModel({
    this.adult_,
    this.backdropPath_,
    this.genreIds_,
    this.id_,
    this.originCountry_,
    this.originalLanguage_,
    this.originalName_,
    this.overview_,
    this.popularity_,
    this.posterPath_,
    this.firstAirDate_,
    this.name_,
    this.voteAverage_,
    this.voteCount_,
  }) : super(
         backdropPath: backdropPath_ ?? '',
         firstAirDate: firstAirDate_ == null
             ? DateTime.now()
             : DateTime.parse(firstAirDate_),
         id: id_ ?? 0,
         name: name_ ?? '',
         overview: overview_ ?? '',
         posterPath: posterPath_ ?? '',
       );

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return _$TvShowModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TvShowModelToJson(this);
}
