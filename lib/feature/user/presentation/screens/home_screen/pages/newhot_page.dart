import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/utils/movie_category.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv/tv_show.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/home_bloc/home_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/newhot_bloc/new_hot_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/new_hot_tab_bar_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/error_and_retry.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/coming_soon/coming_soon.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/everyone_watch/everyones_watch.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/new_hot_app_bar.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/top10movies/top10_movie.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/top10tvshows/top10_show.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/shimmer_loaders/shimmer_loader_newhot.dart';

class NewhotPage extends StatefulWidget {
  const NewhotPage({super.key});

  @override
  State<NewhotPage> createState() => _NewhotPageState();
}

class _NewhotPageState extends State<NewhotPage> {
  @override
  void initState() {
    super.initState();
    context.read<NewHotBloc>().add(GetNewHot());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<NewHotBloc, NewHotBlocState>(
      buildWhen: (previous, current) {
        if (current is NewHotLoading) return true;
        if (previous is NewHotLoading && current is NewHotLoaded) return true;

        return false;
      },
      builder: (context, state) {
        if (state is NewHotLoading) {
          return ShimmerLoaderNewhot();
        }
        if (state is! NewHotLoaded) {
          return ErrorAndRetry(bloc: context.read<NewHotBloc>());
        }
        final Map<MovieCategory, List<Movie>> movies = state.movies;
        final Map<TvshowCategory, List<Tvshow>> tvShows = state.tvShows;
        return Stack(
          children: [
            BlocBuilder<NewHotTabBarCubit, int>(
              builder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: IndexedStack(
                    index: index,
                    children: [
                      ComingSoon(
                        size: size,
                        tvShows: tvShows[TvshowCategory.comingSoon],
                      ),
                      EveryonesWatch(
                        size: size,
                        movies: movies[MovieCategory.popular],
                      ),
                      Top10Show(
                        size: size,
                        tvShows: tvShows[TvshowCategory.topRated],
                      ),
                      Top10Movie(
                        size: size,
                        movies: movies[MovieCategory.topRated],
                      ),
                    ],
                  ),
                );
              },
            ),

            NewHotAppBar(size: size),
          ],
        );
      },
    );
  }
}
