import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: .center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: .circular(500),
              border: Border.all(color: AppColors.grey, width: 0.8),
            ),
          ),
          Icon(Icons.play_arrow),
        ],
      ),
    );
  }
}
