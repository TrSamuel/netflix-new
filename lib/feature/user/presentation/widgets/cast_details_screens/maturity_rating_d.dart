import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class MaturityRatingD extends StatelessWidget {
  const MaturityRatingD({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(top: 25),
      child: ColoredBox(
        color: AppColors.mediumGrey,
        child: Padding(
          padding: const .symmetric(horizontal: 6, vertical: 6),
          child: Text(
            "U/A 16+",
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
