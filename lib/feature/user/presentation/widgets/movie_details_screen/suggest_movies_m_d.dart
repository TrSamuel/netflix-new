import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/api/api_const.dart';
import 'package:netflixclonenew/core/di/service_locator.dart';
import 'package:netflixclonenew/core/route/custom_route.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_moviedetails.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/movie_details_screen/movie_details_screen.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/suggestmovie_bloc/suggestmovies_bloc_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/home_page/error_and_retry.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/shimmer_loaders/shimmer_loader_suggestions.dart';

class SuggestMoviesMD extends StatefulWidget {
  final int id;
  const SuggestMoviesMD({super.key, required this.id});

  @override
  State<SuggestMoviesMD> createState() => _SuggestMoviesMDState();
}

class _SuggestMoviesMDState extends State<SuggestMoviesMD> {
  @override
  void initState() {
    super.initState();
    context.read<SuggestmoviesBlocBloc>().add(GetSuggestMovies(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 15, top: 5),
          child: Text(
            "More Like This",
            style: TextStyle(fontSize: AppfontSizes.medium, fontWeight: .bold),
          ),
        ),
        BlocBuilder<SuggestmoviesBlocBloc, SuggestmoviesBlocState>(
          builder: (context, state) {
            if (state is SuggestMoviesLoading) {
              return ShimmerLoaderSuggestions();
            }
            if (state is SuggestMoviesFailure) {
              return ErrorAndRetry(bloc: context.read<SuggestmoviesBlocBloc>(), id: widget.id);
            }
            if (state is! SuggestMoviesLoaded) {
              return SizedBox.shrink();
            }

            final movies = state.movies;

            if (movies.isEmpty) {
              return ErrorAndRetry(bloc: context.read<SuggestmoviesBlocBloc>(), id: widget.id);
            }

            return GridView.builder(
              shrinkWrap: true,
              itemCount: movies.length < 12 ? movies.length : 12,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () async {
                  final movie = await context.read<GetMoviedetails>().call(movies[index].id);
                  movie.fold(
                    (failure) => ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Cannot see movie details"))),
                    (success) => GoTo.page(
                      context,
                      page: MovieDetailsScreen(
                        movieDetails: success,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: .circular(5),
                  child: CachedNetworkImage(
                    imageUrl: '${ApiConst.imgUrl}/${movies[index].posterPath}',
                    fit: .cover,
                    placeholder: (context, url) => Container(color: AppColors.darkGrey),
                    errorWidget: (context, url, error) => Container(color: AppColors.darkGrey),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
