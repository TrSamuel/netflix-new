import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/newhot_bloc/new_hot_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/top10tvshows/top10_item_tvshow.dart';

class Top10Show extends StatelessWidget {
  final List<Tvshow>? tvShows;
  final Size size;
  const Top10Show({super.key, required this.size, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    if (tvShows == null || tvShows!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              """ "Can't Connect" """,
              style: TextStyle(
                fontSize: AppfontSizes.mediumLarge,
                color: AppColors.grey,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                context.read<NewHotBloc>().add(GetNewHot());
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: AppfontSizes.large, fontWeight: .bold),
                shape: RoundedRectangleBorder(borderRadius: .circular(5)),
              ),
              child: Text("Retry"),
            ),
          ],
        ),
      );
    }
    final validTvShows = tvShows!.where((t) => t.backdropPath.isNotEmpty).toList();

    return ListView.builder(
      itemCount: validTvShows.length < 10 ? validTvShows.length : 10,
      itemBuilder: (context, index) {
        final Tvshow tvshow = validTvShows[index];
        return Top10ItemTvshow(size: size, index: index, tvshow: tvshow);
      },
    );
  }
}
