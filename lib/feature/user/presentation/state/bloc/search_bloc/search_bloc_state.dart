part of 'search_bloc.dart';

sealed class SearchBlocState {
  const SearchBlocState();
}

final class SearchBlocInitial extends SearchBlocState {}

final class LoadingSearched extends SearchBlocState {}

final class LoadedSearched extends SearchBlocState {
  final List<Movie> movies;
  final List<Tvshow> tvShows;

  LoadedSearched({required this.movies, required this.tvShows});
}

final class LoadedSearchFailure extends SearchBlocState {
  final String message;

  LoadedSearchFailure({required this.message});
}
