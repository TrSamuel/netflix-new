import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie_details.dart';

abstract class MovieRepo {
  Future<Either<MainFailure, List<Movie>>> geMovies(MovieCategory category);
  Future<Either<MainFailure, MovieDetails>> getMovieDetails(int id);
}
