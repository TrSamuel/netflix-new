import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';

class DefaultIMGofList extends StatelessWidget {
  const DefaultIMGofList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: .circular(5),
        image: DecorationImage(
        fit: .cover,
        image: NetworkImage(TestAppconst.backdropPath))),
    );
  }
}
