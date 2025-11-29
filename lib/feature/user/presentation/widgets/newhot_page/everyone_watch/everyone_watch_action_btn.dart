import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

class EveryoneWatchActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  const EveryoneWatchActionBtn({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(icon),
          SizedBox(height: 8 ),
          Text(label, style: TextStyle(color: AppColors.grey)),
        ],
      ),
    );
  }
}
