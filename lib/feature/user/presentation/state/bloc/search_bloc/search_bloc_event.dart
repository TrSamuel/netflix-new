part of 'search_bloc.dart';

sealed class SearchBlocEvent {
  const SearchBlocEvent();
}

final class SearchMoviesShows extends SearchBlocEvent {
  final String query;

  SearchMoviesShows({required this.query});
}

final class ResetSearch extends SearchBlocEvent{}
