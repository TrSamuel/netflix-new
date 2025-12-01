import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';

class GetMovies {
  final MovieRepo movieRepo;

  GetMovies({required this.movieRepo});

  Future<List<Movie>> call(MovieCategory category)=>movieRepo.geMovies(category);
}