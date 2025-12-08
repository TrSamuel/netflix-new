import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/api/api_const.dart';

class EveryoneWatchItemIMG extends StatelessWidget {
  final String img;
  const EveryoneWatchItemIMG({
    super.key,
    required this.size,
    required this.img,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(5),
      child: CachedNetworkImage(
        fit: .cover,
        width: size.width,
        height: 220,
        imageUrl: '${ApiConst.imgUrl}/$img',
      ),
    );
  }
}
