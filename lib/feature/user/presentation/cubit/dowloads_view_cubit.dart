import 'package:flutter_bloc/flutter_bloc.dart';

class DowloadsViewCubit extends Cubit<bool>{
  DowloadsViewCubit():super(false);

  void openDowloads(){
    emit(true);
  }

  void closeDownloads(){
    emit(false);
  }
  
}