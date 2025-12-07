import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/search_bloc/search_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/dowloads_view_cubit.dart';
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
      body: DefaultMoviesShows(),
    );
  }

  PreferredSize _buildSearchBar(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return PreferredSize(
      preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
      child: SearchBar(
        controller: searchController,
        onChanged: (query) {
          context.read<SearchBloc>().add(IsSearching(query: query));
        },
        leading: Icon(Icons.search, color: AppColors.grey),
        hintText: 'Search games, shows, mo...',
        trailing: [
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) => state is IsSearchingState
                ? IconButton(
                    onPressed: () {
                      context.read<SearchBloc>().add(IsSearching(query: ''));
                      searchController.clear();
                    },
                    icon: Icon(Icons.close),
                    color: AppColors.grey,
                  )
                : IconButton(onPressed: () {}, icon: Icon(Icons.mic_none), color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
