import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/feature/user/presentation/cubit/dowloads_view_cubit.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/my_netflix/downloads.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/my_netflix/favor.dart';

class FavorAndDownlods extends StatelessWidget {
  const FavorAndDownlods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: BlocBuilder<DowloadsViewCubit,bool>(
        builder: (context, isDownloads) =>
        isDownloads?
        Downloads()
        : Favor(),
      ),
    );
  }
}
