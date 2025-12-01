import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/description_new_hot.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_screen/newhot_page/title_and_actions.dart';

class Top10ItemNewHot extends StatelessWidget {
  const Top10ItemNewHot({super.key, required this.size, required this.index});

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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppfontSizes.xLarge,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: .circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/73oKTGsw2kf03G5BRSX1pOCFwIn.jpg',
                      ),
                    ),
                  ),
                ),
                TitleAndActions(),
                DescriptionNewHot(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
