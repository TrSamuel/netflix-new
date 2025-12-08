part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialSearchState extends SearchState {}

class IsSearchingState extends SearchState {}

class LoadingRecommState extends SearchState {}

class LoadedRecommMoviesShows extends SearchState {
  final List<Movie> movies;
  final List<Tvshow> tvShows;

  LoadedRecommMoviesShows({required this.movies, required this.tvShows});

  @override
  List<Object> get props => [movies, tvShows];
}

class RecommFailure extends SearchState {}
