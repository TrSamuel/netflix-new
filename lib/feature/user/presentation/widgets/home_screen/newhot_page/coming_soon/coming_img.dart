import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/api/api_const.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

class ComingImg extends StatelessWidget {
  final String img;
  const ComingImg({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(8),
      child: CachedNetworkImage(
        imageUrl: '${ApiConst.imgUrl}/$img',
        height: 200,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            Container(height: 200, color: AppColors.darkGrey),
        errorWidget: (context, url, error) =>
            Container(height: 150, color: AppColors.darkGrey),
      ),
    );
  }
}
