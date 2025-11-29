import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/new_hot_tab_bar_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/newhot_page/bottom_tab_bar_new_hot.dart';

class NewHotAppBar extends StatelessWidget {
  const NewHotAppBar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 80,
      backgroundColor: AppColors.transparentBlack,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppfontSizes.large,
      ),
      title: Text("New & Hot"),
      actions: [
        IconButton(
          onPressed: () {
            context.read<BottomnavCubit>().changeindex(2);
          },
          icon: Icon(Icons.download),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
      bottom: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: SingleChildScrollView(
          scrollDirection: .horizontal,
          child: BlocBuilder<NewHotTabBarCubit, int>(
            builder: (context, index) {
              return Row(
                children: [
                  BottomTabBarNewHot(
                    imgPath: 'assets/images/comingsoon.png',
                    label: "Coming Soon",
                    onTap: () {
                      context.read<NewHotTabBarCubit>().changeindex(0);
                    },
                    isSelected: index == 0,
                  ),
                  BottomTabBarNewHot(
                    imgPath: 'assets/images/everyoneswatching.png',
                    label: "Everyone's Watching",
                    onTap: () {
                      context.read<NewHotTabBarCubit>().changeindex(1);
                    },
                    isSelected: index == 1,
                  ),
                  BottomTabBarNewHot(
                    imgPath: 'assets/images/top10.png',
                    label: "Top 10 Shows",
                    onTap: () {
                      context.read<NewHotTabBarCubit>().changeindex(2);
                    },
                    isSelected: index == 2,
                  ),
                  BottomTabBarNewHot(
                    imgPath: 'assets/images/top10.png',
                    label: "Top 10 Movies",
                    onTap: () {
                      context.read<NewHotTabBarCubit>().changeindex(3);
                    },
                    isSelected: index == 3,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
