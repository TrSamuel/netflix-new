part of 'movidetails_bloc.dart';

sealed class MovidetailsBlocEvent {
  const MovidetailsBlocEvent();
}

final class GetMoviedetailsEvent extends MovidetailsBlocEvent{
  final int id;

  GetMoviedetailsEvent({required this.id});
}
