import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/action_button_movidetails_d.dart';

class MovieDetailsD extends StatelessWidget {
  const MovieDetailsD({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            "Stephen",
            style: TextStyle(fontSize: AppfontSizes.xLarge, fontWeight: .bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Text("2025"),
                SizedBox(width: 15),
                ColoredBox(color: AppColors.mediumGrey, child: Text("U/A 13+")),
                SizedBox(width: 15),
                Text("2h 11m"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Watch in Tamil..",
              style: TextStyle(fontSize: AppfontSizes.mediumLarge, fontWeight: .bold),
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
          OverViewMovieD(),
        ],
      ),
    );
  }
}

class OverViewMovieD extends StatelessWidget {
  const OverViewMovieD({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(top: 8),
      child: Text("""Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
    Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
    nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
    reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
    """, style: TextStyle(fontSize: AppfontSizes.mediumSmall)),
    );
  }
}
