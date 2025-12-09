
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv/tv_show.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_tvshows.dart';
part 'recomm_event.dart';
part 'recomm_state.dart';

class RecommBloc extends Bloc<RecommEvent, RecommState> {
  final GetMovies getMovies;
  final GetTvshows getTvshows;
  RecommBloc({required this.getMovies, required this.getTvshows}) : super(InitialRecommState()) {
    on<GetRecommEvent>(getRecomm);
  }

  Future getRecomm(GetRecommEvent event, Emitter emit) async {
    emit(LoadingRecommState());
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
  }
}
