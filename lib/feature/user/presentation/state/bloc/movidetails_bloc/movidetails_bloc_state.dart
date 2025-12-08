part of 'movidetails_bloc.dart';

sealed class MovidetailsBlocState {
  const MovidetailsBlocState();
}

final class MovidetailsBlocInitial extends MovidetailsBlocState {}

final class MovieDetailsLoading extends MovidetailsBlocState {}

final class MovieDetailsLoaded extends MovidetailsBlocState {
  final MovieDetails movieDetails;

  MovieDetailsLoaded({required this.movieDetails});
}

final class MovieDetailsFailure extends MovidetailsBlocState {}
