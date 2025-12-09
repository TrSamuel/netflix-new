import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';

class SearchMovies {
  final MovieRepo movieRepo;

  SearchMovies({required this.movieRepo});

  Future<Either<MainFailure, List<Movie>>> call(String query) => movieRepo.searchMovies(query);
}
