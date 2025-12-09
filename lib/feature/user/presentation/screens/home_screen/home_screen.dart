import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/pages/home_page.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/pages/mynetflix_page.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/pages/newhot_page.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomnavCubit, int>(
        builder: (context, index) {
          return IndexedStack(
            index: index,
            children: [HomePage(), NewhotPage(), MynetflixPage()],
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(isHome: true),
    );
  }
}
