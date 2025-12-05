part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitState extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final Map<MovieCategory, List<Movie>> movies;
  final Map<TvshowCategory,List<Tvshow>> tvShows;

  HomeLoaded({required this.movies, required this.tvShows});
}

final class HomeLoadedFailure extends HomeState {}
