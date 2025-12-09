part of 'suggestmovies_bloc_bloc.dart';

sealed class SuggestmoviesBlocEvent {
  const SuggestmoviesBlocEvent();
}

final class GetSuggestMovies extends SuggestmoviesBlocEvent {
  final int id;

  GetSuggestMovies({required this.id});
}
