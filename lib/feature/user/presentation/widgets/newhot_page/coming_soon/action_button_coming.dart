import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

class ActionButtonComing extends StatelessWidget {
  final String label;
  final IconData icon;
  const ActionButtonComing({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(icon), Text(label,style: TextStyle(color: AppColors.grey),)]);
  }
}
