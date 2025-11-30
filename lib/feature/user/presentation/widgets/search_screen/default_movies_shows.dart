import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/search_screen/default_i_m_gof_list.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/search_screen/movie_show_name.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/search_screen/play_button.dart';

class DefaultMoviesShows extends StatelessWidget {
  const DefaultMoviesShows({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Recommend Shows & Movies",
                style: TextStyle(
                  fontSize: AppfontSizes.large,
                  fontWeight: .bold,
                ),
              ),
            ),
            Padding(
              padding: const .only(top: 10),
              child: Column(
                children: List.generate(
                  15,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        DefaultIMGofList(),
                        MovieShowName(),
                        Spacer(),
                        PlayButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
