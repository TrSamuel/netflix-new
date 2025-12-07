import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class DescriptionNewHot extends StatelessWidget {
  final String overview;
  const DescriptionNewHot({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Text(
        overview,
        style: TextStyle(fontSize: AppfontSizes.mediumSmall, color: AppColors.grey),
      ),
    );
  }
}
