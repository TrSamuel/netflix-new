import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/route/custom_route.dart';
import 'package:netflixclonenew/feature/user/presentation/screens/home_screen/home_screen.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/bottomnav_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/state/cubit/dowloads_view_cubit.dart';

class BottomNavBar extends StatelessWidget {
  final bool isHome;
  const BottomNavBar({super.key, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavCubit, int>(
      builder: (context, index) {
        return BottomNavigationBar(
          currentIndex: index,
          onTap: (newIndex) {
            context.read<BottomnavCubit>().changeindex(newIndex);
            if (!isHome) {
              GoTo.page(context, page: HomeScreen());
            }
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
        );
      },
    );
  }
}
