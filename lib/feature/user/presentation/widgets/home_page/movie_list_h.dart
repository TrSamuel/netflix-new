import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';

class MovieListH extends StatelessWidget {
  const MovieListH({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(bottom: 18),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const .only(left: 8),
            child: Text(
              "Your Next Watch",
              style: TextStyle(fontSize: AppfontSizes.large, fontWeight: .w900),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: .horizontal,
            child: Row(
              children: .generate(20, (index) {
                return Padding(
                  padding: const .all(5.0),
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: .circular(3),
                      image: DecorationImage(
                        fit: .cover,
                        image: NetworkImage(TestAppconst.img),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
