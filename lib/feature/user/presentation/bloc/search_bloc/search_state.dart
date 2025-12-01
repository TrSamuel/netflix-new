part of 'search_bloc.dart';

sealed class SearchState {}

class InitialSearchState extends SearchState {}

class IsSearchingState extends SearchState {}
