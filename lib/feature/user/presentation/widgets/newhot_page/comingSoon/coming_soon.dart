import 'package:flutter/material.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/newhot_page/comingSoon/movie_item_coming_soon.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieItemComingSoon(size: size),
        MovieItemComingSoon(size: size),
        MovieItemComingSoon(size: size),
        MovieItemComingSoon(size: size),
      ],
    );
  }
}
