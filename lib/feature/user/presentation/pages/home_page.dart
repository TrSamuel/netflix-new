import 'package:flutter/material.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_page/hero_card_home.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_page/home_app_bar.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_page/movie_list_h.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_page/movielist_top10h.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomScrollView(
      slivers: [
        HomeAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            HeroCardHome(size: size),
            MovieListH(),
            MovieListH(),
            MovielistTop10h(),
            MovieListH(),
            MovieListH(),
          ]),
        ),
      ],
    );
  }
}
