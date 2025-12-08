import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_tvshows.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMovies getMovies;
  final GetTvshows getTvshows;

  HomeBloc({required this.getMovies, required this.getTvshows})
    : super(HomeInitState()) {
    on<GetHomeItemsEvent>(loadMoviesShows);
  }

  Future<void> loadMoviesShows(HomeEvent event, Emitter emit) async {
    emit(HomeLoading());
    await Future.delayed(Duration(seconds: 3));
    final movies = await getMoviesMap(event);

    final tvshows = await getTvShowsMap(event);

    if (movies.isNotEmpty || tvshows.isNotEmpty) {
      emit(HomeLoaded(movies: movies, tvShows: tvshows));
    } else {
      emit(HomeLoadedFailure());
    }
  }

  Future<Map<MovieCategory, List<Movie>>> getMoviesMap(HomeEvent event) async {
    final Map<MovieCategory, List<Movie>> movies = {};

    final resultsM = await Future.wait(
      (event as GetHomeItemsEvent).movCategrs.map(
        (category) => getMovies(category),
      ),
    );

    for (int i = 0; i < event.movCategrs.length; i++) {
      resultsM[i].fold(
        (failure) => null,
        (success) => movies[event.movCategrs[i]] = success,
      );
    }

    return movies;
  }

  Future<Map<TvshowCategory, List<Tvshow>>> getTvShowsMap(
    HomeEvent event,
  ) async {
    final Map<TvshowCategory, List<Tvshow>> tvshows = {};

    final resultsT = await Future.wait(
      (event as GetHomeItemsEvent).tvCategrs.map(
        (category) => getTvshows(category),
      ),
    );

    for (int i = 0; i < event.tvCategrs.length; i++) {
      resultsT[i].fold(
        (failure) => null,
        (success) => tvshows[event.tvCategrs[i]] = success,
      );
    }

    return tvshows;
  }
}
