import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie_details.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/action_button_movidetails_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/over_view_movie_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/starring_and_more_movie_d.dart';

class MovieDetailsD extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsD({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            movieDetails.title,
            style: TextStyle(fontSize: AppfontSizes.xLarge, fontWeight: .bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Text("${movieDetails.releaseDate.year}"),
                SizedBox(width: 15),
                ColoredBox(
                  color: AppColors.mediumGrey,
                  child: Text(movieDetails.maturityRating),
                ),
                SizedBox(width: 15),
                Text(movieDetails.duration),
              ],
            ),
          ),
          if (movieDetails.transLanguages.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Watch in ${List.generate(movieDetails.transLanguages.length < 3 ? movieDetails.transLanguages.length : 3, (index) => "${movieDetails.transLanguages[index]}${index < 2 ? ', ' : ''}").join()}",
                style: TextStyle(
                  fontSize: AppfontSizes.mediumLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ActionButtonMovidetailsD(
            bgColor: AppColors.white,
            fgColor: AppColors.black,
            icon: Icons.play_arrow,
            label: 'Play',
          ),
          ActionButtonMovidetailsD(
            bgColor: AppColors.greyBtn,
            fgColor: AppColors.white,
            icon: Icons.download,
            label: 'Download',
          ),
          OverViewMovieD(overview: movieDetails.overview),
          StarringAndMoreMovieD(movieDetails: movieDetails),
          Text(
            "Director: ${movieDetails.director}",
            style: TextStyle(
              color: AppColors.grey,
              fontSize: AppfontSizes.mediumSmall,
            ),
          ),
        ],
      ),
    );
  }
}
