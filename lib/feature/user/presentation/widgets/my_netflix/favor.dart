import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/my_netflix/liked/like_items_my_netflix.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/my_netflix/liked_my_list_item_list.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/my_netflix/my_list/my_list.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/my_netflix/my_net_flix_icon.dart';

class Favor extends StatelessWidget {
  const Favor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          MyNetFlixIcon(),
          LikeItemsMyNetflix(),
          MyList(),
          Padding(
            padding: const .only(top: 18),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const .all(8),
                  child: Text(
                    "Trailers You Have Watched",
                    style: TextStyle(
                      fontSize: AppfontSizes.mediumLarge,
                      fontWeight: .bold,
                    ),
                  ),
                ),
                LikedMyListItemList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
