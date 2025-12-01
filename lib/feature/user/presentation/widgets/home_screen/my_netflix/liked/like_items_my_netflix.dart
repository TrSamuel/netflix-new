import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/my_netflix/liked/image_item.dart';

class LikeItemsMyNetflix extends StatelessWidget {
  const LikeItemsMyNetflix({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Shows & Movies You have Liked",
              style: TextStyle(
                fontSize: AppfontSizes.mediumLarge,
                fontWeight: .bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(children: List.generate(10, (index) => ImageItem())),
            ),
          ),
        ],
      ),
    );
  }
}
