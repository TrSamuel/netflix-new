import 'package:flutter/material.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/movie_details_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/trailer_movie_d.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

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
          TrailerMovieD(),
          MovieDetailsD(),
        ],
      ),
    );
  }
}
