import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/route/custom_route.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/dowloads_view_cubit.dart';
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
              GoTo.page(context, page: SearchScreen());
            },
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
    );
  }
}
