part of 'movie_bloc.dart';

@immutable
sealed class MovieBlocEvent extends Equatable {}

final class LoadMoviesEvent extends MovieBlocEvent {
  @override
  List<Object?> get props => [];
  LoadMoviesEvent();
}
