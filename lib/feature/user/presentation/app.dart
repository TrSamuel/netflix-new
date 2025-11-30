import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_theme.dart';
import 'package:netflixclonenew/feature/user/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/new_hot_tab_bar_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/home_screen.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/pages/home_page.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/pages/mynetflix_page.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/pages/newhot_page.dart';

const pages = [HomePage(), NewhotPage(), MynetflixPage()];

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomnavCubit()),
        BlocProvider(create: (context) => NewHotTabBarCubit()),
        BlocProvider(create: (context) => DowloadsViewCubit()),
        BlocProvider(create: (context) => SearchBloc()),
      ],
      child: MaterialApp(
        theme: AppTheme.data,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
