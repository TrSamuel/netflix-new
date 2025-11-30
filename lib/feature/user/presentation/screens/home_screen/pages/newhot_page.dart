import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/new_hot_tab_bar_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/coming_soon/coming_soon.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/everyone_watch/everyones_watch.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/new_hot_app_bar.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/top10_show_movie.dart';

class NewhotPage extends StatelessWidget {
  const NewhotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomScrollView(
      slivers: [
        NewHotAppBar(size: size),
        SliverFillRemaining(
          child: BlocBuilder<NewHotTabBarCubit, int>(
            builder: (context, index) {
              return IndexedStack(
                index: index,
                children: [
                  ComingSoon(size: size),
                  EveryonesWatch(size: size),
                  Top10ShowMovie(size: size),
                  Top10ShowMovie(size: size),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
