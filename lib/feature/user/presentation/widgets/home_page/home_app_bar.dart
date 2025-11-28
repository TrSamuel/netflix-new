import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 80,
      backgroundColor: AppColors.transparentBlack,
      leading: Padding(
        padding: const .all(8.0),
        child: Image.asset('assets/logo/netflixlogo.png'),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.download)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }
}
