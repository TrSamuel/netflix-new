import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/pages/home_page.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/pages/mynetflix_page.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/pages/newhot_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavCubit, int>(
      builder: (context, index) {
        return Scaffold(
          body: IndexedStack(
            index: index,
            children: [HomePage(), NewhotPage(), MynetflixPage()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (newIndex) {
              context.read<BottomnavCubit>().changeindex(newIndex);
              if (newIndex == 2) {
                context.read<DowloadsViewCubit>().closeDownloads();
              }
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
        );
      },
    );
  }
}
