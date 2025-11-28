import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/home_page/hero_card_h_action_button.dart';

class HeroCardHome extends StatelessWidget {
  const HeroCardHome({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: .bottomCenter,
        children: [
          Container(
            width: size.width * 0.9,
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: .cover,
                image: NetworkImage(
                  TestAppconst.img,
                ),
              ),
              color: TestAppconst.widgetTestcolor,
              borderRadius: .circular(15),
              border: .all(width: 0.5, color: AppColors.white, style: .solid),
              shape: .rectangle,
            ),
          ),
          SizedBox(
            width: size.width * 0.9,
            height: 100,
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                HeroCardHActionButton(
                  bgColor: AppColors.white,
                  fgColor: AppColors.black,
                  icon: Icons.play_arrow,
                  label: 'Play',
                ),
                HeroCardHActionButton(
                  bgColor: AppColors.greyBtn,
                  fgColor: AppColors.white,
                  icon: Icons.add,
                  label: 'My List',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
