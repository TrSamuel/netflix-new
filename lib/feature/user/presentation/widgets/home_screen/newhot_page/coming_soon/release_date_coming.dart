import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class ReleaseDateComing extends StatelessWidget {
  const ReleaseDateComing({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.2,
      height: 300,
      child: Column(
        children: [
          Text(
            "DEC",
            style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.grey),
          ),
          Text(
            "25",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppfontSizes.xLarge,
            ),
          ),
        ],
      ),
    );
  }
}
