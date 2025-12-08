import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/newhot_bloc/new_hot_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/top10movies/top10_item_movie.dart';

class Top10Movie extends StatelessWidget {
  final List<Movie>? movies;
  final Size size;
  const Top10Movie({super.key, required this.size, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies == null || movies!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              """ "Can't Connect" """,
              style: TextStyle(
                fontSize: AppfontSizes.mediumLarge,
                color: AppColors.grey,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                context.read<NewHotBloc>().add(GetNewHot());
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: AppfontSizes.large,
                  fontWeight: .bold,
                ),
                shape: RoundedRectangleBorder(borderRadius: .circular(5)),
              ),
              child: Text("Retry"),
            ),
          ],
        ),
      );
    }

    final validMovies = movies!
        .where((m) => m.backdropPath.isNotEmpty)
        .toList();
    return ListView.builder(
      itemCount: validMovies.length < 10 ? validMovies.length : 10,
      itemBuilder: (context, index) {
        final Movie movie = validMovies[index];
        return Top10ItemMovie(size: size, index: index, movie: movie);
      },
    );
  }
}
