import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/coming_soon/coming_img.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/coming_soon/release_date_coming.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/coming_soon/title_and_buttons_coming.dart';

class TvItemComingSoon extends StatelessWidget {
  final Tvshow tvshow;
  const TvItemComingSoon({super.key, required this.size, required this.tvshow});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(bottom: 18),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          ReleaseDateComing(size: size, date: tvshow.firstAirDate),
          SizedBox(
            width: size.width * 0.8,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                ComingImg(img: tvshow.backdropPath),
                TitleAndButtonsComing(title: tvshow.name),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Coming on ${DateFormat('MMMM').format(tvshow.firstAirDate)} ${tvshow.firstAirDate.day}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppfontSizes.medium),
                  ),
                ),
                if (tvshow.overview.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      tvshow.overview,
                      style: TextStyle(fontSize: AppfontSizes.mediumSmall, color: AppColors.grey),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
