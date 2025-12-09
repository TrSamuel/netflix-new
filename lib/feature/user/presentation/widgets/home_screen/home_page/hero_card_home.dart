import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/api/api_const.dart';
import 'package:netflixclonenew/core/di/service_locator.dart';
import 'package:netflixclonenew/core/route/custom_route.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_moviedetails.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/movie_details_screen/movie_details_screen.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/hero_card_h_action_button.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/hero_card_home_d_efault.dart';

class HeroCardHome extends StatelessWidget {
  final List<Movie>? movies;
  const HeroCardHome({super.key, required this.size, required this.movies});

  final Size size;

  @override
  Widget build(BuildContext context) {
    Movie movie;
    if (movies == null || movies!.isEmpty) {
      return HeroCardHomeDEfault(size: size);
    }
    movie = movies!.first;
    if (movie.posterPath.isEmpty) {
      return HeroCardHomeDEfault(size: size);
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: .bottomCenter,
        children: [
          InkWell(
            onTap: () async {
              final movieData = await context.read<GetMoviedetails>().call(movie.id);
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
                        imageUrl: '${ApiConst.imgUrl}/${movie.posterPath}',
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
