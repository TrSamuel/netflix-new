import 'package:flutter/material.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie_details.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/bottom_nav_bar.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/movie_details_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/suggest_movies_m_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/trailer_movie_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/user_favorite_button.dart';

class TvDetailsScreen extends StatelessWidget {
  final int bottomNavIndex;
  final MovieDetails movieDetails;
  const TvDetailsScreen({
    super.key,
    required this.movieDetails,
    required this.bottomNavIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.download)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: ListView(
        children: [
          TrailerMovieD(img: movieDetails.backdropPath),
          MovieDetailsD(movieDetails: movieDetails),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                UserFavoriteButton(icon: Icons.add, label: 'My List'),
                UserFavoriteButton(
                  icon: Icons.thumb_up_outlined,
                  label: 'Rate',
                ),
                UserFavoriteButton(icon: Icons.share, label: 'Share'),
                SizedBox(width: 15),
              ],
            ),
          ),
          SuggestMoviesMD(id: movieDetails.id, ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(isHome: false),
    );
  }
}
