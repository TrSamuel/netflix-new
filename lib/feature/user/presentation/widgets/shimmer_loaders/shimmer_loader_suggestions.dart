import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerLoaderSuggestions extends StatelessWidget {
  const ShimmerLoaderSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: Duration(seconds: 2),
      interval: Duration.zero,
      color: AppColors.mediumGrey,
      direction: ShimmerDirection.fromLTRB(),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.5,
        ),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: .circular(5),
            color: AppColors.shimmerLoaderColor,
          ),
        ),
      ),
    );
  }
}
