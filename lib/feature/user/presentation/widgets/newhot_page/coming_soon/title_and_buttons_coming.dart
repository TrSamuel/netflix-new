import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/newhot_page/coming_soon/action_button_coming.dart';

class TitleAndButtonsComing extends StatelessWidget {
  const TitleAndButtonsComing({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "Title",
            style: TextStyle(
              fontSize: AppfontSizes.large,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          ActionButtonComing(
            icon: Icons.notifications_none,
            label: 'Remind Me',
          ),
          SizedBox(width: 35),
          ActionButtonComing(icon: Icons.info, label: 'Info'),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
