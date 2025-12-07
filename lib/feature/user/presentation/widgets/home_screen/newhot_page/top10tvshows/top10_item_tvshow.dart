import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/api/api_const.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/description_new_hot.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/title_and_actions.dart';

class Top10ItemTvshow extends StatelessWidget {
  final Tvshow tvshow;
  const Top10ItemTvshow({super.key, required this.size, required this.index, required this.tvshow});

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(bottom: 18),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          SizedBox(
            width: size.width * 0.2,
            height: 300,
            child: Text(
              "${index + 1}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppfontSizes.xLarge),
            ),
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                ClipRRect(
                  borderRadius: .circular(8),
                  child: CachedNetworkImage(
                    height: 200,
                    fit: BoxFit.cover,
                    imageUrl: '${ApiConst.imgUrl}/${tvshow.backdropPath}',
                  ),
                ),

                TitleAndActions(title: tvshow.name, titleWidth: 100),
                DescriptionNewHot(overview: tvshow.overview),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
