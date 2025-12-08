import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie_details.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/movidetails_bloc/movidetails_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/error_and_retry.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/movie_details_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/trailer_movie_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/movie_details_screen/user_favorite_button.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int id;
  const MovieDetailsScreen({super.key, required this.id});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovidetailsBloc>().add(GetMoviedetailsEvent(id: widget.id));
  }

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
      body: BlocBuilder<MovidetailsBloc, MovidetailsBlocState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieDetailsFailure) {
            return ErrorAndRetry();
          }
          if (state is! MovieDetailsLoaded) {
            return SizedBox.shrink();
          }

          final MovieDetails movieDetails = state.movieDetails;
          return ListView(
            children: [
              TrailerMovieD(),
              MovieDetailsD(),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    UserFavoriteButton(icon: Icons.add, label: 'My List'),
                    UserFavoriteButton(icon: Icons.thumb_up_outlined, label: 'Rate'),
                    UserFavoriteButton(icon: Icons.share, label: 'Share'),
                    SizedBox(width: 15),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, bottom: 15, top: 5),
                    child: Text(
                      "More Like This",
                      style: TextStyle(fontSize: AppfontSizes.medium, fontWeight: .bold),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 12,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1 / 1.5,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MovieDetailsScreen(id: 0)),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: .circular(5),
                        child: CachedNetworkImage(imageUrl: TestAppconst.posterPath, fit: .cover),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
