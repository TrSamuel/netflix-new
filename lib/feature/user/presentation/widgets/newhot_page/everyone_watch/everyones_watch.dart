import 'package:flutter/material.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/newhot_page/everyone_watch/movie_item_everyones_watch.dart';

class EveryonesWatch extends StatelessWidget {
  const EveryonesWatch({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MovieItemEveryonesWatch(size: size),
          MovieItemEveryonesWatch(size: size),
          MovieItemEveryonesWatch(size: size),
          MovieItemEveryonesWatch(size: size),
        ],
      ),
    );
  }
}
