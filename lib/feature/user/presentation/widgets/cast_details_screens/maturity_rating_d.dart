import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class MaturityRatingD extends StatelessWidget {
  final String maturityRating;
  const MaturityRatingD({super.key, required this.maturityRating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(top: 25),
      child: ColoredBox(
        color: AppColors.mediumGrey,
        child: Padding(
          padding: const .symmetric(horizontal: 6, vertical: 6),
          child: Text(
            maturityRating,
            style: TextStyle(
              fontSize: AppfontSizes.large,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
