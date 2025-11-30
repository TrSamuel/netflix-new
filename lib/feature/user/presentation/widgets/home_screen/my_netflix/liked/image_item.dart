import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';

 class ImageItem extends StatelessWidget {
  const ImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: .circular(5),topRight: .circular(5)),
              image: DecorationImage(
                fit: .cover,
                image: NetworkImage(TestAppconst.posterPath),
              ),
            ),
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(color: AppColors.darkGrey),
            child: TextButton.icon(
              onPressed: () {},
              label: Text("Share"),
              icon: Icon(Icons.share_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
