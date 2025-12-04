import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_movies.dart';

part 'movie_bloc_event.dart';
part 'movie_bloc_state.dart';

class MovieBloc extends Bloc<MovieBlocEvent, MovieBlocState> {
  final GetMovies getMovies;
  MovieBloc({required this.getMovies}) : super(MovieBlocInitial()) {
    on<LoadMoviesEvent>((event, emit) async {
      emit((state as MoviesSuccess).copyWith(isLoading: true));

      final Map<MovieCategory, List<Movie>> movies = {};

      final nowPlayingMovies = await getMovies(MovieCategory.nowPlaying);
      final upcomingMovies = await getMovies(MovieCategory.upcoming);
      final topRatedMovies = await getMovies(MovieCategory.topRated);
      final popularMovies = await getMovies(MovieCategory.popular);
      final trendingDayMovies = await getMovies(MovieCategory.trendingDay);
      final trendingWeekMovies = await getMovies(MovieCategory.trendingWeek);

      nowPlayingMovies.fold((failure) =>  , ifRight)

      if (nowPlayingMovies.isNotEmpty) {
        movies[MovieCategory.nowPlaying] = nowPlayingMovies;
      }

      if (upcomingMovies.isNotEmpty) {
        movies[MovieCategory.upcoming] = upcomingMovies;
      }

      if (topRatedMovies.isNotEmpty) {
        movies[MovieCategory.topRated] = topRatedMovies;
      }

      if (popularMovies.isNotEmpty) {
        movies[MovieCategory.popular] = popularMovies;
      }

      if (trendingDayMovies.isNotEmpty) {
        movies[MovieCategory.trendingDay] = trendingDayMovies;
      }

      if (trendingWeekMovies.isNotEmpty) {
        movies[MovieCategory.trendingWeek] = trendingWeekMovies;
      }

      if (movies.isEmpty) {
        emit(MoviesFailure());
      } else {
        emit(MoviesSuccess(movies: movies));
      }
    });
  }
}
