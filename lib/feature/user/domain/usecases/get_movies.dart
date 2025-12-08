import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';

class GetMovies {
  final MovieRepo movieRepo;

  GetMovies({required this.movieRepo});

  Future<Either<MainFailure, List<Movie>>> call(MovieCategory category) =>
      movieRepo.geMovies(category);
}
