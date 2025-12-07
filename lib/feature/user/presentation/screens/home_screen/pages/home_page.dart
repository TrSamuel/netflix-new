import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/home_bloc/home_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/hero_card_home.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/home_app_bar.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/movie_list_h.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/movielist_top10h.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/tvshow_list_h.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/tvshowlist_top10h.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/shimmer_loaders/shimmer_loader_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetHomeItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        if (current is HomeLoading) return true;
        if (previous is HomeLoading && current is HomeLoaded) return true;

        return false;
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return ShimmerLoaderHomePage();
        }
        if (state is! HomeLoaded) {
           return Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              """ "Can't Connect" """,
              style: TextStyle(
                fontSize: AppfontSizes.mediumLarge,
                color: AppColors.grey,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(GetHomeItemsEvent());
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: AppfontSizes.large, fontWeight: .bold),
                shape: RoundedRectangleBorder(borderRadius: .circular(5)),
              ),
              child: Text("Retry"),
            ),
          ],
        ),
      );
        }
        final Map<MovieCategory, List<Movie>> movies = state.movies;
        final Map<TvshowCategory, List<Tvshow>> tvShows = state.tvShows;
        return RefreshIndicator(
          onRefresh: () async{
            context.read<HomeBloc>().add(GetHomeItemsEvent());
            await Future.delayed(Duration(milliseconds: 500));
          },
          child: CustomScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              HomeAppBar(),
              SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 13, (context, index) {
                  final list = [
                    HeroCardHome(size: size, movies: movies[MovieCategory.trendingDay]),
                    TvshowListH(
                      label: 'Popular TV Shows',
                      tvShows: tvShows[TvshowCategory.popular],
                    ),
                    MovieListH(
                      movies: movies[MovieCategory.nowPlaying],
                      label: 'Now playing movies',
                    ),
                    TvshowListH(
                      label: 'Trending TV Shows Today',
                      tvShows: tvShows[TvshowCategory.trendingDay],
                    ),
                    MovielistTop10h(
                      label: 'Top 10 Popular Movies',
                      movies: movies[MovieCategory.popular],
                    ),

                    MovieListH(
                      movies: movies[MovieCategory.trendingWeek],
                      label: 'Trending week movies',
                    ),
                    TvshowlistTop10h(
                      label: 'TV Shows Airing Today',
                      tvShows: tvShows[TvshowCategory.airingToday],
                    ),
                    MovieListH(movies: movies[MovieCategory.topRated], label: 'Top rated movies'),
                    TvshowListH(
                      label: 'Top Rated TV Shows',
                      tvShows: tvShows[TvshowCategory.topRated],
                    ),
                    MovielistTop10h(
                      label: 'Top 10 Trending day Movies',
                      movies: movies[MovieCategory.trendingDay],
                    ),
                    TvshowlistTop10h(
                      label: 'Top 10 on the Air Shows',
                      tvShows: tvShows[TvshowCategory.onTheAir],
                    ),
                    MovieListH(movies: movies[MovieCategory.upcoming], label: 'Upcoming movies'),
                    TvshowlistTop10h(
                      label: 'Top 10 Weekly Trending TV Shows',
                      tvShows: tvShows[TvshowCategory.trendingWeek],
                    ),
                  ];

                  return list[index];
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
