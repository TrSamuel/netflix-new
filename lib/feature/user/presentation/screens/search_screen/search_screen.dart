import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/api/api_const.dart';
import 'package:netflixclonenew/core/di/service_locator.dart';
import 'package:netflixclonenew/core/route/custom_route.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_moviedetails.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/movie_details_screen/movie_details_screen.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/recomitems_bloc/recomm_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/search_bloc/search_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/search_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/search_screen/default_movies_shows.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context
                ..read<BottomnavCubit>().changeindex(2)
                ..read<DowloadsViewCubit>().openDowloads();
              Navigator.pop(context);
            },
            icon: Icon(Icons.download),
          ),
        ],
        bottom: _buildSearchBar(context),
      ),
      body: BlocBuilder<SearchBlocBloc, SearchBlocState>(
        builder: (context, state) {
          if (state is SearchBlocInitial) {
            return DefaultMoviesShows();
          }
          if (state is LoadingSearched) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadedSearchFailure) {
            return Center(child: Text(state.message));
          }
          final movies = (state as LoadedSearched).movies;
          return GridView.builder(
            shrinkWrap: true,
            itemCount: movies.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.5,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () async {
                final movie = await sl<GetMoviedetails>().call(movies[index].id);
                movie.fold(
                  (failure) => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Cannot see movie details"))),
                  (success) => GoTo.page(context, page: MovieDetailsScreen(movieDetails: success)),
                );
              },
              child: ClipRRect(
                borderRadius: .circular(5),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConst.imgUrl}/${movies[index].posterPath}',
                  fit: .cover,
                  placeholder: (context, url) => Container(color: AppColors.darkGrey),
                  errorWidget: (context, url, error) => Container(color: AppColors.darkGrey),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSize _buildSearchBar(BuildContext context) {
    final searchController = TextEditingController();

    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 50),
      child: Builder(
        builder: (innerContext) {
          return SearchBar(
            controller: searchController,
            onChanged: (query) async {
              if (query.isEmpty) {
                innerContext
                  ..read<SearchCubit>().isSearching('')
                  ..read<SearchBlocBloc>().add(ResetSearch());
                searchController.clear();
              } else {
                innerContext
                  ..read<SearchCubit>().isSearching(query)
                  ..read<SearchBlocBloc>().add(SearchMoviesShows(query: query));
                ;
              }
            },
            leading: Icon(Icons.search, color: AppColors.grey),
            hintText: 'Search games, shows, mo...',
            trailing: [
              BlocBuilder<SearchCubit, bool>(
                builder: (innerContext, isSearching) {
                  return isSearching
                      ? IconButton(
                          onPressed: () {
                            innerContext.read<SearchCubit>().isSearching('');
                            searchController.clear();
                          },
                          icon: Icon(Icons.close),
                          color: AppColors.grey,
                        )
                      : IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.mic_none),
                          color: AppColors.grey,
                        );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
