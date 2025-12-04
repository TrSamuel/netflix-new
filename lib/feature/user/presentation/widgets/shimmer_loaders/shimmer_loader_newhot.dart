import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/new_hot_tab_bar_cubit.dart';

class ShimmerLoaderNewhot extends StatelessWidget {
  const ShimmerLoaderNewhot({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
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
                context
                  ..read<BottomnavCubit>().changeindex(2)
                  ..read<DowloadsViewCubit>().openDowloads();
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
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 110,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 28, 28, 28),
                            borderRadius: .circular(15),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          child: BlocBuilder<NewHotTabBarCubit, int>(
            builder: (context, index) {
              return SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const .only(bottom: 18),
                      child: Row(
                        crossAxisAlignment: .start,
                        children: [
                          SizedBox(width: size.width * 0.2, height: 300),
                          SizedBox(
                            width: size.width * 0.8,
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: .circular(8),
                                    color: AppColors.shimmerLoaderColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: .circular(20),
                                          color: AppColors.shimmerLoaderColor,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: .circular(20),
                                          color: AppColors.shimmerLoaderColor,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 400,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        28,
                                        28,
                                        28,
                                      ),
                                      borderRadius: .circular(50),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: .start,
                                    children: List.generate(
                                      15,
                                      (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.shimmerLoaderColor,
                                            borderRadius: .circular(50),
                                          ),
                                          width: index % 3 == 0 ? 400 : 200,
                                          height: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
