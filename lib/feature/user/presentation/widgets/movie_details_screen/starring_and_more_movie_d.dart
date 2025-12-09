import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/route/custom_route.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie_details.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/cast_details_screens/movie/cast_detailsscreen_m.dart';

class StarringAndMoreMovieD extends StatelessWidget {
  final MovieDetails movieDetails;
  const StarringAndMoreMovieD({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoTo.page(
          context,
          page: CastDetailsScreenMovie(movieDetails: movieDetails),
        );
      },
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            "Starring: ${List.generate(movieDetails.casts.length < 5 ? movieDetails.casts.length : 5, (index) => '${movieDetails.casts[index]}, ').join()}",
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
