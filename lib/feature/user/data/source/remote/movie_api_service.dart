import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/data/model/movie_details_model/movie_details_model.dart';
import 'package:netflixclonenew/feature/user/data/model/movie_model/movie_model.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';

sealed class MovieService {
  Future<Either<MainFailure, List<MovieModel>>> getMovies(MovieCategory category);
  Future<Either<MainFailure, MovieDetailsModel>> getMovieDetails(int id);
  Future<Either<MainFailure, List<Movie>>> getRecommMovies(int id);
  Future<Either<MainFailure, List<MovieModel>>> searchMovies(String query);
}

final class MovieApiService extends MovieService {
  final Dio dio;

  MovieApiService({required this.dio});

  @override
  Future<Either<MainFailure, List<MovieModel>>> getMovies(MovieCategory category) async {
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
          (response.data['results'] as List).map((m) => MovieModel.fromJson(m)).toList(),
        );
      }
      if (response.statusCode == 404) {
        return left(ClientFailure());
      }
      return left(ServerFailure());
    } catch (e) {
      debugPrint("failed to get $category movies: $e");
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<MainFailure, MovieDetailsModel>> getMovieDetails(int id) async {
    try {
      final response = await dio.get(
        '/movie/$id',
        queryParameters: {'append_to_response': 'credits,translations,release_dates'},
      );

      if (response.statusCode == 200) {
        return right(MovieDetailsModel.fromJson((response.data as Map<String, dynamic>)));
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
  Future<Either<MainFailure, List<Movie>>> getRecommMovies(int id) async {
    try {
      final Response response = await dio.get('/movie/$id/recommendations');
      if (response.statusCode == 200) {
        return right(
          (response.data['results'] as List).map((m) => MovieModel.fromJson(m)).toList(),
        );
      }
      if (response.statusCode == 404) {
        return left(ClientFailure());
      }

      return left(ServerFailure());
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<MovieModel>>> searchMovies(String query) async {
    try {
      final Response response = await dio.get(
        '/search/movie',
        queryParameters: {'query': query},
      );

      if (response.statusCode == 200) {
        return right(
          (response.data['results'] as List).map((m) => MovieModel.fromJson(m)).toList(),
        );
      }
      if (response.statusCode == 404) {
        return left(ClientFailure());
      }
      return left(ServerFailure());
    } catch (e) {
      debugPrint("failed to get search movies: $e");
      return left(ServerFailure());
    }
  }
}
