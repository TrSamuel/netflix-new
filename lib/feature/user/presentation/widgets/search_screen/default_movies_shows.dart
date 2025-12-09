import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/recomitems_bloc/recomm_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/error_and_retry.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/search_screen/recomm_item_img.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/search_screen/movie_show_name.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/search_screen/play_button.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/shimmer_loaders/shimmerloader_searchscreen.dart';

class DefaultMoviesShows extends StatefulWidget {
  const DefaultMoviesShows({super.key});

  @override
  State<DefaultMoviesShows> createState() => _DefaultMoviesShowsState();
}

class _DefaultMoviesShowsState extends State<DefaultMoviesShows> {
  @override
  void initState() {
    super.initState();
    context.read<RecommBloc>().add(GetRecommEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommBloc, RecommState>(
      builder: (context, state) {
        if (state is LoadingRecommState) {
          return Center(child: ShimmerloaderSearchscreen());
        }
        if (state is! LoadedRecommMoviesShows) {
          return ErrorAndRetry(bloc: context.read<RecommBloc>());
        }
        final movies = state.movies;
        final tvShows = state.tvShows;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Recommend Shows & Movies",
                    style: TextStyle(
                      fontSize: AppfontSizes.large,
                      fontWeight: .bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const .only(top: 10),
                  child: Column(
                    children: [
                      ...List.generate(
                        movies.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              RecommItemIMg(
                                backdropPath: movies[index].backdropPath,
                              ),
                              MovieShowName(name: movies[index].title),
                              Spacer(),
                              PlayButton(),
                            ],
                          ),
                        ),
                      ),
                      ...List.generate(
                        tvShows.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              RecommItemIMg(
                                backdropPath: tvShows[index].backdropPath,
                              ),
                              MovieShowName(name: tvShows[index].name),
                              Spacer(),
                              PlayButton(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
