import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerloaderSearchscreen extends StatelessWidget {
  const ShimmerloaderSearchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
     duration: Duration(seconds: 2),
      interval: Duration.zero,
      
      color: AppColors.mediumGrey,
      direction: ShimmerDirection.fromLTRB(),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 250,
                  height: 25,
                  decoration: BoxDecoration(
                    color: AppColors.shimmerLoaderColor,
                    borderRadius: .circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const .only(top: 10),
                child: Column(
                  children: [
                    ...List.generate(
                      25,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: .circular(5),
                                color: AppColors.shimmerLoaderColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: 150,
                                child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: .circular(20),
                                    color: AppColors.shimmerLoaderColor,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: .circular(500),
                                  color: AppColors.shimmerLoaderColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
