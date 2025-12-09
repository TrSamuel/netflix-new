import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<bool> {
  SearchCubit() : super(false);

  Future<void> isSearching(String query) async {
    if (query.isNotEmpty) {
      emit(true);
    } else {
      emit(false);
    }
  }
}
