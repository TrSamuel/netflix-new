import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

class BottomTabBarNewHot extends StatelessWidget {
  final String label;
  final String imgPath;
  final VoidCallback onTap;
  final bool isSelected;
  const BottomTabBarNewHot({
    super.key,
    required this.label,
    required this.imgPath,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.white : AppColors.black,
          foregroundColor: isSelected ? AppColors.black : AppColors.white,
        ),
        onPressed: onTap,
        label: Text(label),
        icon: Image.asset(imgPath, fit: BoxFit.cover, height: 25),
      ),
    );
  }
}
