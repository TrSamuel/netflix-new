part of 'new_hot_bloc.dart';

sealed class NewHotBlocEvent {
  const NewHotBlocEvent();

}

class GetNewHot extends NewHotBlocEvent{
  final movCategrs = [
    MovieCategory.popular,
    MovieCategory.topRated,
  ];

  final tvCategrs = [
    TvshowCategory.comingSoon,
    TvshowCategory.topRated,
  ];
}
