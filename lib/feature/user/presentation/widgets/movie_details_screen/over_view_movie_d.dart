import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class OverViewMovieD extends StatelessWidget {
  const OverViewMovieD({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(top: 8),
      child: Text("""Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
    Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
    nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
    reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
    """, style: TextStyle(fontSize: AppfontSizes.mediumSmall)),
    );
  }
}
