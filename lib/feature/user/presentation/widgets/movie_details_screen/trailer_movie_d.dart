import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';

class TrailerMovieD extends StatelessWidget {
  const TrailerMovieD({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        color: TestAppconst.widgetTestcolor,
        image: DecorationImage(fit: .cover, image: NetworkImage(TestAppconst.backdropPath)),
      ),
    );
  }
}
