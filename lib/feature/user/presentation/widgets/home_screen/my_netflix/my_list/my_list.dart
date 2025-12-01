import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/my_netflix/liked_my_list_item_list.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "My List",
                  style: TextStyle(
                    fontSize: AppfontSizes.mediumLarge,
                    fontWeight: .bold,
                  ),
                ),
                TextButton.icon(
                  iconAlignment: .end,
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontWeight: .bold,
                      fontSize: AppfontSizes.mediumLarge,
                    ),
                  ),
                  onPressed: () {},
                  label: Text("See All"),
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ],
            ),
          ),
          LikedMyListItemList(),
        ],
      ),
    );
  }
}
