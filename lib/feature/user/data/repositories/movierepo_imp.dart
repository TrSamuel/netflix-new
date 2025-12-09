import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/data/source/remote/movie_api_service.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie_details.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';

class MovierepoImp extends MovieRepo {
  final MovieService movieService;

  MovierepoImp({required this.movieService});
  @override
  Future<Either<MainFailure, List<Movie>>> geMovies(MovieCategory category) async =>
      await movieService.getMovies(category);

  @override
  Future<Either<MainFailure, MovieDetails>> getMovieDetails(int id) async =>
      await movieService.getMovieDetails(id);

  @override
  Future<Either<MainFailure, List<Movie>>> geRecommMovies(int id) async =>
      await movieService.getRecommMovies(id);

  @override
  Future<Either<MainFailure, List<Movie>>> searchMovies(String query) async =>
      await movieService.searchMovies(query);
}
