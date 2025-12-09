import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/api/api_const.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';

class TrailerMovieD extends StatelessWidget {
  final String img;
  const TrailerMovieD({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        height: 230,
        fit: .cover,
        imageUrl: '${ApiConst.imgUrl}/$img',
        placeholder: (context, url) => Container(
          width: .infinity,
          height: 230,
          color: AppColors.black,
          child: Center(child: Icon(Icons.movie)),
        ),
        errorWidget: (context, url, error) => Container(
          width: 100,
          height: 150,
          color: AppColors.darkGrey,
          child: Center(child: Icon(Icons.movie)),
        ),
      ),
    );
  }
}
