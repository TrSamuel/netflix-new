part of 'search_bloc.dart';

sealed class SearchEvent {}

class IsSearching extends SearchEvent {
  final String query;

  IsSearching({required this.query});
}
