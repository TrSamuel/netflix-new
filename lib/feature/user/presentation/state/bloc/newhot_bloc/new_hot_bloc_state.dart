part of 'new_hot_bloc.dart';

sealed class NewHotBlocState extends Equatable {
  const NewHotBlocState();

  @override
  List<Object> get props => [];
}

final class NewHotBlocInitial extends NewHotBlocState {}

final class NewHotLoading extends NewHotBlocState{}

final class NewHotLoaded extends NewHotBlocState {
  final Map<MovieCategory, List<Movie>> movies;
  final Map<TvshowCategory, List<Tvshow>> tvShows;

  const NewHotLoaded({required this.movies, required this.tvShows});


  @override
  List<Object> get props => [movies,tvShows];
}

final class NewHotFailure extends NewHotBlocState{}