import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class ActionButtonMovidetailsD extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color fgColor;
  final Color bgColor;
  const ActionButtonMovidetailsD({
    super.key,
    required this.label,
    required this.icon,
    required this.fgColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(top: 6),
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text(label),
        icon: Icon(icon),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          fixedSize: Size.fromWidth(MediaQuery.sizeOf(context).width),
          padding: EdgeInsets.symmetric(vertical: 9),
          shape: RoundedRectangleBorder(borderRadius: .circular(5)),
          iconSize: 28,
          textStyle: TextStyle(
            fontSize: AppfontSizes.mediumLarge,
            fontWeight: .bold,
          ),
        ),
      ),
    );
  }
}
