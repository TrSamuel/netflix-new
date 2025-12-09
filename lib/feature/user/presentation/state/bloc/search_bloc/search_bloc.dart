import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv/tv_show.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/search_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/search_tv.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

class SearchBlocBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  final SearchMovies searchMovies;
  final SearchTv searchTv;
  SearchBlocBloc({required this.searchMovies, required this.searchTv})
    : super(SearchBlocInitial()) {
    on<SearchMoviesShows>((event, emit) async {
      if (event.query.trim().isNotEmpty) {
        emit(LoadingSearched());
      final movieData = await searchMovies(event.query);
      final tvData = await searchTv(event.query);
      List<Movie> movies = [];
      List<Tvshow> tvshows = [];

      movieData.fold((failure) {}, (success) {
        movies = success;
      });

      tvData.fold((failure) {}, (success) {
        tvshows = success;
      });

      if (movies.isEmpty && tvshows.isEmpty) {
        emit(LoadedSearchFailure(message: 'Cannot find movies an shows'));
      } else {
        emit(LoadedSearched(movies: movies, tvShows: tvshows));
      }
      }
    });

    on<ResetSearch>((event, emit) => emit(SearchBlocInitial()),);
  }
}
