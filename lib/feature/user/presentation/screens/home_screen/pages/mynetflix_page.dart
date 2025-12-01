import 'package:flutter/material.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/my_netflix/app_bar_my_netflix.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/my_netflix/favor_and_history.dart';

class MynetflixPage extends StatelessWidget {
  const MynetflixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [AppBarMyNetflix(), FavorAndDownlods()]);
  }
}
