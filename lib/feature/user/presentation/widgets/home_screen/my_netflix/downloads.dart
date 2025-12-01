import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: .end,
        children: [
          CircleAvatar(
            radius: 85,
            backgroundColor: AppColors.darkGrey,
            foregroundColor: AppColors.black,
            child: Icon(Icons.download, size: 105),
          ),

          SizedBox(height: 40),
          Text(
            "Movies and TV shows that\nyou download appear here",
            style: TextStyle(
              color: AppColors.mediumGrey,
              fontSize: AppfontSizes.large,
            ),
          ),
          SizedBox(height: 100),
          ElevatedButton(
            style: ElevatedButton.styleFrom(shape: LinearBorder()),
            onPressed: () {},
            child: Text(
              "Find Something to Download",
              style: TextStyle(fontWeight: .bold),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
