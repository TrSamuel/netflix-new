import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/home_bloc/home_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/newhot_bloc/new_hot_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/recomitems_bloc/recomm_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/suggestmovie_bloc/suggestmovies_bloc_bloc.dart';

class ErrorAndRetry extends StatelessWidget {
  final Bloc bloc;
  final int? id;
  // id of  movie/tv details page  for refresh
  const ErrorAndRetry({super.key, required this.bloc, this.id});

  @override
  Widget build(BuildContext context) {
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
              if (bloc is HomeBloc) {
                context.read<HomeBloc>().add(GetHomeItemsEvent());
              } else if (bloc is NewHotBloc) {
                context.read<NewHotBloc>().add(GetNewHot());
              } else if (bloc is RecommBloc) {
                context.read<RecommBloc>().add(GetRecommEvent());
              } else if (bloc is SuggestmoviesBlocBloc) {
                context.read<SuggestmoviesBlocBloc>().add(
                  GetSuggestMovies(id: id!),
                );
              }
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
}
