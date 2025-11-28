import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

class HeroCardHome extends StatelessWidget {
  const HeroCardHome({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      child: Container(
        width: size.width * 0.9,
        height: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://image.tmdb.org/t/p/original/6QlAcGRaUrgHcZ4WTBh5lsPnzKx.jpg',
            ),
          ),
          color: AppColors.widgetTestcolor,
          borderRadius: .circular(15),
          border: .all(width: 0.5, color: AppColors.white, style: .solid),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
