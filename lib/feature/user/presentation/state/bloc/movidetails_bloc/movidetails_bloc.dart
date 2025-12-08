import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie_details.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_moviedetails.dart';

part 'movidetails_bloc_event.dart';
part 'movidetails_bloc_state.dart';

class MovidetailsBloc extends Bloc<MovidetailsBlocEvent, MovidetailsBlocState> {
  final GetMoviedetails getMoviedetails;
  MovidetailsBloc(this.getMoviedetails) : super(MovidetailsBlocInitial()) {
    on<GetMoviedetailsEvent>((event, emit) async {
      emit(MovieDetailsLoading());
      final movieDetails = await getMoviedetails(event.id);
      movieDetails.fold(
        (failure) => emit(MovieDetailsFailure()),
        (success) => emit(MovieDetailsLoaded(movieDetails: success)),
      );
    });
  }
}
