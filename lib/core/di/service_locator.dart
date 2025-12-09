import 'package:get_it/get_it.dart';
import 'package:netflixclonenew/core/api/dio_client.dart';
import 'package:netflixclonenew/feature/user/data/repositories/movierepo_imp.dart';
import 'package:netflixclonenew/feature/user/data/repositories/tvshowrepo_imp.dart';
import 'package:netflixclonenew/feature/user/data/source/remote/movie_api_service.dart';
import 'package:netflixclonenew/feature/user/data/source/remote/tvshow_api_service.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/tvshow_repo.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_moviedetails.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_recommovies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_tvshows.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/search_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/search_tv.dart';

 final sl = GetIt.instance;
 void initDi() {
    sl
      ..registerLazySingleton<DioClient>(() => DioClient()..createDio())
      ..registerLazySingleton<MovieService>(() => MovieApiService(dio: sl<DioClient>().dio))
      ..registerLazySingleton<TvshowService>(() => TvshowApiService(dio: sl<DioClient>().dio))
      ..registerLazySingleton<MovieRepo>(() => MovierepoImp(movieService: sl<MovieService>()))
      ..registerLazySingleton<TvshowRepo>(() => TvshowrepoImp(tvshowService: sl<TvshowService>()))
      ..registerLazySingleton<GetMovies>(() => GetMovies(movieRepo: sl<MovieRepo>()))
      ..registerLazySingleton<GetTvshows>(() => GetTvshows(tvshowRepo: sl<TvshowRepo>()))
      ..registerLazySingleton<GetMoviedetails>(() => GetMoviedetails(movieRepo: sl<MovieRepo>()))
      ..registerLazySingleton<SearchMovies>(() => SearchMovies(movieRepo: sl<MovieRepo>()))
       ..registerLazySingleton<SearchTv>(() => SearchTv(tvshowRepo: sl<TvshowRepo>()))
      ..registerLazySingleton<GetRecommovies>(() => GetRecommovies(movieRepo: sl<MovieRepo>()));
  }

