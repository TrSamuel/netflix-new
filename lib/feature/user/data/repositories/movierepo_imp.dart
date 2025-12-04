import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/data/source/remote/movie_api_service.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';

class MovierepoImp extends MovieRepo {
  final movieService = MovieApiService.instance;
  @override
  Future<Either<MainFailure,List<Movie>>> geMovies(MovieCategory category) async =>
      await movieService.getMovies(category);
}
