import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/state/bloc/home_bloc/home_bloc.dart';

class ErrorAndRetry extends StatelessWidget {
  const ErrorAndRetry({super.key});

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
              context.read<HomeBloc>().add(GetHomeItemsEvent());
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
