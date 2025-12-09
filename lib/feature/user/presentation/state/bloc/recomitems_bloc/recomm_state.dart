part of 'recomm_bloc.dart';

sealed class RecommState {
}

final class InitialRecommState extends RecommState {}

class LoadingRecommState extends RecommState {}

class LoadedRecommMoviesShows extends RecommState {
  final List<Movie> movies;
  final List<Tvshow> tvShows;

  LoadedRecommMoviesShows({required this.movies, required this.tvShows});

}

class RecommFailure extends RecommState {}
