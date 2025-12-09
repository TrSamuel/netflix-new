import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclonenew/core/api/api_const.dart';
import 'package:netflixclonenew/core/di/service_locator.dart';
import 'package:netflixclonenew/core/route/custom_route.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_moviedetails.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/movie_details_screen/movie_details_screen.dart';
import 'package:stroke_text/stroke_text.dart';

class MovielistTop10h extends StatelessWidget {
  final String label;
  final List<Movie>? movies;
  const MovielistTop10h({super.key, required this.label, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies == null || movies!.isEmpty) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: .only(bottom: 18),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const .only(left: 8),
            child: Text(
              label,
              style: TextStyle(fontSize: AppfontSizes.large, fontWeight: .w900),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: .horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                final movie = movies![index];
                return Padding(
                  padding: const .all(5.0),
                  child: Stack(
                    alignment: .bottomLeft,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 85,
                        child: StrokeText(
                          text: '${index + 1}',
                          strokeColor: AppColors.white,
                          textStyle: GoogleFonts.oswald(fontSize: 10, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          strokeWidth: 2,
                          textScaler: TextScaler.linear(9),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: InkWell(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              fit: .cover,
                              width: 100,
                              height: 150,
                              imageUrl: '${ApiConst.imgUrl}/${movie.posterPath}',
                              placeholder: (context, url) =>
                                  Container(width: 100, height: 150, color: AppColors.darkGrey),
                              errorWidget: (context, url, error) =>
                                  Container(width: 100, height: 150, color: AppColors.darkGrey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
