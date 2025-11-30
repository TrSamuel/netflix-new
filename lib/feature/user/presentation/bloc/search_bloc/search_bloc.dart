import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialSearchState()) {
    on<IsSearching>((event, emit) {
      if (event.query.isNotEmpty) {
        emit(IsSearchingState());
      } else {
        emit(InitialSearchState());
      }
    });
  }
}
