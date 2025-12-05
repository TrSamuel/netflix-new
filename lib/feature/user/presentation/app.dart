import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_theme.dart';
import 'package:netflixclonenew/feature/user/data/repositories/movierepo_imp.dart';
import 'package:netflixclonenew/feature/user/data/repositories/tvshowrepo_imp.dart';
import 'package:netflixclonenew/feature/user/data/source/remote/movie_api_service.dart';
import 'package:netflixclonenew/feature/user/data/source/remote/tvshow_api_service.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/movie_repo.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/tvshow_repo.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_tvshows.dart';
import 'package:netflixclonenew/feature/user/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/new_hot_tab_bar_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/home_screen.dart';

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MovieRepo>(
          create: (context) =>
              MovierepoImp(movieService: MovieApiService.instance),
        ),
        RepositoryProvider<TvshowRepo>(
          create: (context) =>
              TvshowrepoImp(tvshowService: TvshowApiService.instance),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BottomnavCubit()),
          BlocProvider(create: (context) => NewHotTabBarCubit()),
          BlocProvider(create: (context) => DowloadsViewCubit()),
          BlocProvider(create: (context) => SearchBloc()),
          BlocProvider(
            create: (context) => HomeBloc(
              getMovies: GetMovies(movieRepo: context.read<MovieRepo>()),
              getTvshows: GetTvshows(tvshowRepo: context.read<TvshowRepo>()),
            ),
          ),
        ],
        child: MaterialApp(
          theme: AppTheme.data,
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
