import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class DataName extends StatelessWidget {
  final String label;
  const DataName({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(top: 25),
      child: Text(
        label,
        style: TextStyle(
          fontSize: AppfontSizes.mediumLarge,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
