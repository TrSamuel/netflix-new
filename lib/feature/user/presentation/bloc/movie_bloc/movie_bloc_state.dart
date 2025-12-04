part of 'movie_bloc.dart';

@immutable
sealed class MovieBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MovieBlocInitial extends MovieBlocState {}

final class MoviesSuccess extends MovieBlocState {
  final bool isLoading;
  final Map<MovieCategory, List<Movie>> movies;

  MoviesSuccess({required this.movies, required this.isLoading});

  MoviesSuccess copyWith({
    bool? isLoading,
    Map<MovieCategory, List<Movie>>? movies,
  }) => MoviesSuccess(
    movies: movies ?? this.movies,
    isLoading: isLoading ?? this.isLoading,
  );

  @override
  List<Object?> get props => [movies];
}
