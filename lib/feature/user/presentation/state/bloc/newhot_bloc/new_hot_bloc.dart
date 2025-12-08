import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_tvshows.dart';

part 'new_hot_bloc_event.dart';
part 'new_hot_bloc_state.dart';

class NewHotBloc extends Bloc<NewHotBlocEvent, NewHotBlocState> {
  final GetMovies getMovies;
  final GetTvshows getTvshows;
  NewHotBloc(this.getMovies, this.getTvshows) : super(NewHotBlocInitial()) {
    on<NewHotBlocEvent>(loadMoviesShows);
  }

  Future<void> loadMoviesShows(NewHotBlocEvent event, Emitter emit) async {
    emit(NewHotLoading());
    await Future.delayed(Duration(seconds: 3));
    final movies = await getMoviesMap(event);

    final tvshows = await getTvShowsMap(event);

    if (movies.isNotEmpty || tvshows.isNotEmpty) {
      emit(NewHotLoaded(movies: movies, tvShows: tvshows));
    } else {
      emit(NewHotFailure());
    }
  }

  Future<Map<MovieCategory, List<Movie>>> getMoviesMap(
    NewHotBlocEvent event,
  ) async {
    final Map<MovieCategory, List<Movie>> movies = {};

    final resultsM = await Future.wait(
      (event as GetNewHot).movCategrs.map((category) => getMovies(category)),
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
    NewHotBlocEvent event,
  ) async {
    final Map<TvshowCategory, List<Tvshow>> tvshows = {};

    final resultsT = await Future.wait(
      (event as GetNewHot).tvCategrs.map((category) => getTvshows(category)),
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
