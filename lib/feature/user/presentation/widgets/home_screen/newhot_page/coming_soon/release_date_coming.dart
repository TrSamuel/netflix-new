import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class ReleaseDateComing extends StatelessWidget {
  final DateTime date;
  const ReleaseDateComing({super.key, required this.size, required this.date});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final month = DateFormat('MMM').format(date).toUpperCase();
    return SizedBox(
      width: size.width * 0.2,
      height: 300,
      child: Column(
        children: [
          Text(
            month,
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.grey),
          ),
          Text(
            "${date.day}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppfontSizes.xLarge),
          ),
        ],
      ),
    );
  }
}
