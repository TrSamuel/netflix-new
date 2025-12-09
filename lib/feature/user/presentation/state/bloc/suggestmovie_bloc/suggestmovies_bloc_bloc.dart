import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_recommovies.dart';

part 'suggestmovies_bloc_event.dart';
part 'suggestmovies_bloc_state.dart';

class SuggestmoviesBlocBloc
    extends Bloc<SuggestmoviesBlocEvent, SuggestmoviesBlocState> {
  final GetRecommovies getRecommovies;
  SuggestmoviesBlocBloc(this.getRecommovies)
    : super(SuggestmoviesBlocInitial()) {
    on<GetSuggestMovies>((event, emit) async {
      emit(SuggestMoviesLoading());
      final movies = await getRecommovies(event.id);
      movies.fold(
        (failure) => emit(SuggestMoviesFailure()),
        (success) => emit(SuggestMoviesLoaded(movies: success)),
      );
    });
  }
}
