part of 'suggestmovies_bloc_bloc.dart';

sealed class SuggestmoviesBlocState {
  const SuggestmoviesBlocState();
}

final class SuggestmoviesBlocInitial extends SuggestmoviesBlocState {}

final class SuggestMoviesLoading extends SuggestmoviesBlocState {}

final class SuggestMoviesLoaded extends SuggestmoviesBlocState {
  final List<Movie> movies;

  SuggestMoviesLoaded({required this.movies});
}

final class SuggestMoviesFailure extends SuggestmoviesBlocState {}
