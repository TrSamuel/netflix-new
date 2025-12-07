import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class MovieShowName extends StatelessWidget {
  final String name;
  const MovieShowName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: 150,
        child: Text(
          maxLines: 2,
          overflow: .ellipsis,
          name,
          style: TextStyle(fontWeight: .bold, fontSize: AppfontSizes.medium),
        ),
      ),
    );
  }
}
