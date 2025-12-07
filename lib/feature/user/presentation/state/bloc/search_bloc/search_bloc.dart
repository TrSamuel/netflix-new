import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_tvshows.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetMovies getMovies;
  final GetTvshows getTvshows;
  SearchBloc({required this.getMovies, required this.getTvshows}) : super(InitialSearchState()) {
    on<GetRecommEvent>((event, emit) async {
      emit(LoadingRecommState());
      await Future.delayed(Duration(seconds: 3));
      List<Movie> movies = [];
      List<Tvshow> tvShows = [];
      final moviesResponse = await getMovies(MovieCategory.nowPlaying);
      final showsResponse = await getTvshows(TvshowCategory.popular);
      moviesResponse.fold((failure) {}, (success) {
        movies = success;
      });
      showsResponse.fold((failure) {}, (success) {
        tvShows = success;
      });

      if (movies.isNotEmpty || tvShows.isNotEmpty) {
        emit(LoadedRecommMoviesShows(movies: movies, tvShows: tvShows));
      } else {
        emit(RecommFailure());
      }
    });
    on<IsSearching>((event, emit) {
      if (event.query.isNotEmpty) {
        emit(IsSearchingState());
      } else {
        emit(InitialSearchState());
      }
    });
  }
}
