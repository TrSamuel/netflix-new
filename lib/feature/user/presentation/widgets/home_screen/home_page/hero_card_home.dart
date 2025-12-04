import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/api/api_const.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/hero_card_h_action_button.dart';

class HeroCardHome extends StatelessWidget {
  final List<Movie>? movies;
  const HeroCardHome({super.key, required this.size, required this.movies});

  final Size size;

  @override
  Widget build(BuildContext context) {
    Movie? movie;
    if (movies != null && movies!.isNotEmpty) {
      movie = movies!.first;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: .bottomCenter,
        children: [
          Container(
            width: size.width * 0.9,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: .circular(15),
              border: .all(width: 0.5, color: AppColors.white, style: .solid),
            ),
            child: ClipRRect(
              borderRadius: .circular(15),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: movie != null
                          ? '${ApiConst.imgUrl}/${movie.posterPath}'
                          : TestAppconst.posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0, 0.2),
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.transparentBlack,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.9,
            height: 100,
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                HeroCardHActionButton(
                  bgColor: AppColors.white,
                  fgColor: AppColors.black,
                  icon: Icons.play_arrow,
                  label: 'Play',
                ),
                HeroCardHActionButton(
                  bgColor: AppColors.greyBtn,
                  fgColor: AppColors.white,
                  icon: Icons.add,
                  label: 'My List',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
