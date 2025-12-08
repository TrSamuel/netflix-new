import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/route/custom_route.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/cast_details_screens/movie/cast_detailsscreen_m.dart';

class StarringAndMoreMovieD extends StatelessWidget {
  const StarringAndMoreMovieD({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoTo.page(context, page: CastDetailsScreenMovie());
      },
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            "Starring: vishnu,kefdfdf, dfdfdffd, ddddddddddddddddsds,dsdsddsd,  dsdsds,  dsdsd",
            maxLines: 2,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: AppfontSizes.mediumSmall,
            ),
          ),
          Text("..more", style: TextStyle(fontSize: AppfontSizes.mediumSmall)),
        ],
      ),
    );
  }
}
