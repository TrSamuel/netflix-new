import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class OverViewMovieD extends StatelessWidget {
  final String overview;
  const OverViewMovieD({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(top: 8),
      child: Text(
        overview,
        style: TextStyle(fontSize: AppfontSizes.mediumSmall),
      ),
    );
  }
}
