import 'package:flutter_bloc/flutter_bloc.dart';

class NewHotTabBarCubit extends Cubit<int> {
  NewHotTabBarCubit() : super(0);
  void changeindex(int index) {
    emit(index);
  }
}
