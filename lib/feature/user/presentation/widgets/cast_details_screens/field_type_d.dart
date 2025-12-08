import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class FieldTypeD extends StatelessWidget {
  final String label;
  const FieldTypeD({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: AppfontSizes.large, fontWeight: .bold),
    );
  }
}
