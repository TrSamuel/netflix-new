part of 'home_bloc.dart';

sealed class HomeEvent {}

final class GetHomeItemsEvent extends HomeEvent {
  final movCategrs = [
    MovieCategory.nowPlaying,
    MovieCategory.popular,
    MovieCategory.topRated,
    MovieCategory.trendingDay,
    MovieCategory.trendingWeek,
    MovieCategory.upcoming,
  ];

  final tvCategrs = [
    TvshowCategory.airingToday,
    TvshowCategory.onTheAir,
    TvshowCategory.popular,
    TvshowCategory.topRated,
    TvshowCategory.trendingDay,
    TvshowCategory.trendingWeek,
  ];
}
