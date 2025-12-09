import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';

class GetRecommovies {
  final MovieRepo movieRepo;

  GetRecommovies({required this.movieRepo});

  Future<Either<MainFailure, List<Movie>>> call(int id) =>
      movieRepo.geRecommMovies(id);
}
