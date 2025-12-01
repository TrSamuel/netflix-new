import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';

class LikedMyListItemList extends StatelessWidget {
  const LikedMyListItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        child: Row(
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: .circular(5),
                    topRight: .circular(5),
                  ),
                  image: DecorationImage(
                    fit: .cover,
                    image: NetworkImage(TestAppconst.posterPath),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
