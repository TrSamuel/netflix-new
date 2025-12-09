import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:netflixclonenew/feature/user/data/model/tv_show_details_model/tv_show_details_model.dart';
import 'package:netflixclonenew/feature/user/data/model/tv_show_model/tv_show_model.dart';

sealed class TvshowService {
  Future<Either<MainFailure, List<TvShowModel>>> getTvShows(
    TvshowCategory category,
  );
    Future<Either<MainFailure, TvShowDetailsModel>> getTvShowDetails(int id);
      Future<Either<MainFailure, List<TvShowModel>>> searchTvShows(String query);
}

class TvshowApiService extends TvshowService {
  final Dio dio;

  TvshowApiService({required this.dio});

  @override
  Future<Either<MainFailure, List<TvShowModel>>> getTvShows(
    TvshowCategory category,
  ) async {
    try {
      final String path;
      switch (category) {
        case TvshowCategory.airingToday:
          path = '/tv/airing_today';
          break;
        case TvshowCategory.popular:
          path = '/tv/popular';
          break;
        case TvshowCategory.topRated:
          path = '/tv/top_rated';
          break;
        case TvshowCategory.trendingWeek:
          path = '/trending/tv/week';
          break;
        case TvshowCategory.trendingDay:
          path = '/trending/tv/day';
          break;
        case TvshowCategory.onTheAir:
          path = '/tv/on_the_air';
          break;

        case TvshowCategory.comingSoon:
          final now = DateTime.now();
          final tomorrow = now.add(Duration(days: 1));
          final tomorrowStr = DateFormat('yyyy-MM-dd').format(tomorrow);

          path =
              '/discover/tv?first_air_date.gte=$tomorrowStr&sort_by=first_air_date.asc';

          break;
      }

      final response = await dio.get(path);

      if (response.statusCode == 200) {
        return right(
          (response.data['results'] as List)
              .map((t) => TvShowModel.fromJson(t))
              .toList(),
        );
      }
    } catch (e) {
      debugPrint("failed to get $category tvshows: $e");
      return left(ClientFailure());
    }

    return left(ClientFailure());
  }
  

   @override
  Future<Either<MainFailure, TvShowDetailsModel>> getTvShowDetails(int id) async {
    try {
      final response = await dio.get(
        '/tv/$id',
        queryParameters: {
          'append_to_response': 'credits,content_ratings',
        },
      );

      if (response.statusCode == 200) {
        return right(
         TvShowDetailsModel.fromJson((response.data as Map<String, dynamic>)),
        );
      }

      if (response.statusCode == 404) {
        return left(ClientFailure());
      }

      return left(ServerFailure());
    } catch (e) {
      debugPrint('$e');
      return left(ServerFailure());
    }
  }
  
  @override
  Future<Either<MainFailure, List<TvShowModel>>> searchTvShows(String query) async {
    try {
      final Response response = await dio.get(
        '/search/tv',
        queryParameters: {'query': query},
      );

      if (response.statusCode == 200) {
        return right(
          (response.data['results'] as List).map((m) => TvShowModel.fromJson(m)).toList(),
        );
      }
      if (response.statusCode == 404) {
        return left(ClientFailure());
      }
      return left(ServerFailure());
    } catch (e) {
      debugPrint("failed to get search tvshows: $e");
      return left(ServerFailure());
    }
  }
}
