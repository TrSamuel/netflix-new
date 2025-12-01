import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';

abstract class MovieRepo {
 Future<List<Movie>> geMovies(MovieCategory category);
}