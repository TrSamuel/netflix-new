import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/api/api_const.dart';

class RecommItemIMg extends StatelessWidget {
  final String backdropPath;
  const RecommItemIMg({super.key, required this.backdropPath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(5),
      child: CachedNetworkImage(
        width: 140,
        height: 80,
        fit: .cover,
        imageUrl: '${ApiConst.imgUrl}/$backdropPath',
      ),
    );
  }
}
