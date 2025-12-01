import 'package:dio/dio.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';

class MovieApiService {
  MovieApiService.internal();
  static MovieApiService instance = MovieApiService.internal();
  factory MovieApiService() => instance;

  final Dio dio = Dio();

  void getMovies(MovieCategory category) {
    final String path;
    switch (category) {
      case MovieCategory.nowPlaying:
      path='/';
      case MovieCategory.popular:
      path='/';
      case MovieCategory.topRated:
      path='/';
      case MovieCategory.upcoming:
      path='/';
      case MovieCategory.trendingDay:
      path='/';
      case MovieCategory.trendingWeek:
      path='/';
    }
  }
}
