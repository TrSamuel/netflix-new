import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/newhot_bloc/new_hot_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/coming_soon/movie_item_coming_soon.dart';

class ComingSoon extends StatelessWidget {
  final List<Tvshow>? tvShows;
  const ComingSoon({super.key, required this.size, required this.tvShows});

  final Size size;

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
                textStyle: TextStyle(
                  fontSize: AppfontSizes.large,
                  fontWeight: .bold,
                ),
                shape: RoundedRectangleBorder(borderRadius: .circular(5)),
              ),
              child: Text("Retry"),
            ),
          ],
        ),
      );
    }

    final validShows = tvShows!
        .where((tvshow) => tvshow.backdropPath.isNotEmpty)
        .toList();

    return ListView.builder(
      itemCount: validShows.length,
      itemBuilder: (context, index) {
        return TvItemComingSoon(size: size, tvshow: validShows[index]);
      },
    );
  }
}
