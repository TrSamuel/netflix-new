import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/utils/navigator_page.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/search_screen/search_screen.dart';

class AppBarMyNetflix extends StatelessWidget {
  const AppBarMyNetflix({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DowloadsViewCubit, bool>(
      builder: (context, isDownloads) => SliverAppBar(
        pinned: true,
        floating: false,
        expandedHeight: 80,
        leading: isDownloads
            ? IconButton(
                onPressed: () {
                  context.read<DowloadsViewCubit>().closeDownloads();
                },
                icon: Icon(Icons.arrow_back),
              )
            : null,
        title: Text(isDownloads ? "Downloads" : "My Netflix"),
        actions: [
          IconButton(
            onPressed: () {
                      NavigatorPage.goTo(SearchScreen(), context);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
    );
  }
}
