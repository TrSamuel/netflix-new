import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie_details.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';

class GetMoviedetails {
  final MovieRepo movieRepo;

  GetMoviedetails({required this.movieRepo});

  Future<Either<MainFailure, MovieDetails>> call(int id) =>
      movieRepo.getMovieDetails(id);
}
