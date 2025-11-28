import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_theme.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/bottomnav_cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/pages/home_page.dart';
import 'package:netflixclonenew/feature/user/presentation/pages/mynetflix_page.dart';
import 'package:netflixclonenew/feature/user/presentation/pages/newhot_page.dart';

const pages = [HomePage(), NewhotPage(), MynetflixPage()];

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomnavCubit(),
      child: MaterialApp(
        theme: AppTheme.data,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<BottomnavCubit, int>(
          builder: (context, index) => Scaffold(
            body: IndexedStack(index: index, children: pages),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (newIndex) {
                context.read<BottomnavCubit>().changeindex(newIndex);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department),
                  label: 'New & Hot',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'My Netflix',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
