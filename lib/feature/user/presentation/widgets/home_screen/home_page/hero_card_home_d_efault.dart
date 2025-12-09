import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/di/service_locator.dart';
import 'package:netflixclonenew/core/route/custom_route.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_moviedetails.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/movie_details_screen/movie_details_screen.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/hero_card_h_action_button.dart';

class HeroCardHomeDEfault extends StatelessWidget {
  final Size size;
  const HeroCardHomeDEfault({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: .bottomCenter,
        children: [
          InkWell(
            onTap: () async {
              final movieData = await context.read<GetMoviedetails>().call(1181110);
              movieData.fold(
                (failure) => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Cannot see movie details"))),
                (success) => GoTo.page(
                  context,
                  page: MovieDetailsScreen(movieDetails: success, ),
                ),
              );
            },
            child: Container(
              width: size.width * 0.9,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: .circular(15),
                border: .all(width: 0.5, color: AppColors.mediumGrey, style: .solid),
              ),
              child: ClipRRect(
                borderRadius: .circular(15),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: TestAppconst.posterPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0, 0.2),
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, AppColors.transparentBlack],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
