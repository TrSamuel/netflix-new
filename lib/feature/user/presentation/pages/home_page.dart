import 'package:flutter/material.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_page/hero_card_home.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_page/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        HomeAppBar(),
        HeroCardHome(size: size),
      ],
    );
  }
}
