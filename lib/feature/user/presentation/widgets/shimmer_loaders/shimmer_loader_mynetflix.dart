import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/my_netflix/app_bar_my_netflix.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/my_netflix/downloads.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/my_netflix/my_net_flix_icon.dart';

class ShimmerLoaderMynetflix extends StatelessWidget {
  const ShimmerLoaderMynetflix({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        AppBarMyNetflix(),
        SliverFillRemaining(
          child: BlocBuilder<DowloadsViewCubit, bool>(
            builder: (context, isDownloads) => isDownloads
                ? Downloads()
                : SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        MyNetFlixIcon(),
                        ...List.generate(
                          2,
                          (index) => Padding(
                            padding: .only(bottom: 18),
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Padding(
                                  padding: .only(left: 8, bottom: 8, top: 38),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * .5,
                                    height: 30,

                                    decoration: BoxDecoration(
                                      color: const .fromARGB(255, 28, 28, 28),
                                      borderRadius: .circular(50),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 160,
                                  child: ListView.builder(
                                    scrollDirection: .horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const .all(5.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Container(
                                            width: 100,
                                            height: 150,
                                            color: const Color.fromARGB(
                                              255,
                                              28,
                                              28,
                                              28,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
