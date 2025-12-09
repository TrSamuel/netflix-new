import 'package:flutter/material.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/description_new_hot.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/everyone_watch/everyone_watch_item_i_m_g.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/title_and_actions.dart';

class MovieItemEveryonesWatch extends StatelessWidget {
  final Movie movie;
  const MovieItemEveryonesWatch({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(bottom: 18),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          EveryoneWatchItemIMG(size: size, img: movie.backdropPath),
          TitleAndActions(title: movie.title, titleWidth: 180),
          DescriptionNewHot(overview: movie.overview),
        ],
      ),
    );
  }
}
