import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class HeroCardHActionButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color fgColor;
  final Color bgColor;
  const HeroCardHActionButton({
    super.key,
    required this.label,
    this.icon,
    required this.fgColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: .symmetric(horizontal: 35),
        shape: RoundedRectangleBorder(borderRadius: .circular(5)),
        backgroundColor: bgColor,
        foregroundColor: fgColor,
      ),
      onPressed: () {},
      label: Text(
        label,
        style: TextStyle(
          fontSize: AppfontSizes.medium,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: icon != null ? Icon(icon) : null,
    );
  }
}
