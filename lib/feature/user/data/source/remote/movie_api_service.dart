import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/api/dio_client.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/data/model/movie_model/movie_model.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';

class MovieApiService {
  MovieApiService.internal();
  static MovieApiService instance = MovieApiService.internal();
  factory MovieApiService() => instance;

  final Dio dio = DioClient.instance.dio;

  Future<Either<MainFailure, List<Movie>>> getMovies(
    MovieCategory category,
  ) async {
    try {
      final String path;
      switch (category) {
        case MovieCategory.nowPlaying:
          path = '/movie/now_playing';
          break;
        case MovieCategory.popular:
          path = '/movie/popular';
          break;
        case MovieCategory.topRated:
          path = '/movie/top_rated';
          break;
        case MovieCategory.upcoming:
          path = '/movie/upcoming';
          break;
        case MovieCategory.trendingDay:
          path = '/trending/movie/day';
          break;
        case MovieCategory.trendingWeek:
          path = '/trending/movie/week';
          break;
      }

      final response = await dio.get(path);

      if (response.statusCode == 200) {
        return right(
          (response.data['results'] as List)
              .map((m) => MovieModel.fromJson(m))
              .toList(),
        );
      }
    } catch (e) {
      debugPrint("failed to get $category movies: $e");
      return left(ClientFailure());
    }

    return left(ClientFailure());
  }
}
