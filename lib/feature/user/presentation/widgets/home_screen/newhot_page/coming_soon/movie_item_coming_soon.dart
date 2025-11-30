import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/coming_soon/coming_img.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/coming_soon/release_date_coming.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/coming_soon/title_and_buttons_coming.dart';

class MovieItemComingSoon extends StatelessWidget {
  const MovieItemComingSoon({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(bottom: 18),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          ReleaseDateComing(size: size),
          SizedBox(
            width: size.width * 0.8,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                ComingImg(),
                TitleAndButtonsComing(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Coming on 5 December",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppfontSizes.medium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                 style: TextStyle(fontSize: AppfontSizes.mediumSmall,color: AppColors.grey),
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
