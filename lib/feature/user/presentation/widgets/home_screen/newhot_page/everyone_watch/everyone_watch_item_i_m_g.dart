import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';

class EveryoneWatchItemIMG extends StatelessWidget {
  const EveryoneWatchItemIMG({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: .circular(5),
        image: DecorationImage(
          fit: .cover,
          image: NetworkImage(TestAppconst.backdropPath),
        ),
      ),
    );
  }
}
