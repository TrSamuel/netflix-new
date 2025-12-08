import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class UserFavoriteButton extends StatelessWidget {
  final String label;
  final IconData icon;
  const UserFavoriteButton({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: InkWell(
        child: Column(
          children: [
            Icon(icon, size: 25),
            Text(
              label,
              style: TextStyle(
                fontSize: AppfontSizes.mediumSmall,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
