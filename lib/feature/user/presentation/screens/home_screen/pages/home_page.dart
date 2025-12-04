import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/hero_card_home.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/home_app_bar.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/movie_list_h.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/movielist_top10h.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/shimmer_loaders/shimmer_loader_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<MovieBloc, MovieBlocState>(
      builder: (context, state) {
        if (state == MoviesLoading()) {
          return ShimmerLoaderHomePage();
        }
        if (state == MovieBlocInitial() || state == MoviesFailure()) {
          return SizedBox.shrink();
        }
        final Map<MovieCategory, List<Movie>> movies =
            (state as MoviesSuccess).movies;
        return CustomScrollView(
          slivers: [
            HomeAppBar(),
            SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 6, (
                context,
                index,
              ) {
                final list = [
                  HeroCardHome(
                    size: size,
                    movies: movies[MovieCategory.trendingDay],
                  ),
                  MovieListH(
                    movies: movies[MovieCategory.nowPlaying],
                    title: 'Now playing movies',
                  ),

                  MovieListH(
                    movies: movies[MovieCategory.trendingWeek],
                    title: 'Trending week movies',
                  ),
                  MovieListH(
                    movies: movies[MovieCategory.topRated],
                    title: 'Top rated movies',
                  ),
                  MovielistTop10h(
                    label: 'Top 10 Popular Movies',
                    movies: movies[MovieCategory.popular],
                  ),
                  MovielistTop10h(
                    label: 'Top 10 Trending day Movies',
                    movies: movies[MovieCategory.trendingDay],
                  ),
                  MovieListH(
                    movies: movies[MovieCategory.upcoming],
                    title: 'Upcoming movies',
                  ),
                ];

                return list[index];
              }),
            ),
          ],
        );
      },
    );
  }
}
