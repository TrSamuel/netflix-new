import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/di/service_locator.dart';
import 'package:netflixclonenew/core/theme/app_theme.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_recommovies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/get_tvshows.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/search_movies.dart';
import 'package:netflixclonenew/feature/user/domain/usecases/search_tv.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/home_screen.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/home_bloc/home_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/newhot_bloc/new_hot_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/recomitems_bloc/recomm_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/search_bloc/search_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/suggestmovie_bloc/suggestmovies_bloc_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/new_hot_tab_bar_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/search_cubit.dart';

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomnavCubit()),
        BlocProvider(create: (context) => NewHotTabBarCubit()),
        BlocProvider(create: (context) => DowloadsViewCubit()),
        BlocProvider(
          create: (context) => RecommBloc(
            getMovies: sl<GetMovies>(),
            getTvshows: sl<GetTvshows>(),
          ),
        ),
        BlocProvider(
          create: (context) => HomeBloc(
            getMovies: sl<GetMovies>(),
            getTvshows: sl<GetTvshows>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              NewHotBloc(sl<GetMovies>(), sl<GetTvshows>()),
        ),
        BlocProvider(
          create: (context) => SuggestmoviesBlocBloc(sl<GetRecommovies>()),
        ),
        BlocProvider(create: (context) => SearchCubit(),),
        BlocProvider(create: (context) => SearchBlocBloc(searchMovies: sl<SearchMovies>(), searchTv:  sl<SearchTv>(),))
      ],
      child: MaterialApp(
        theme: AppTheme.data,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
