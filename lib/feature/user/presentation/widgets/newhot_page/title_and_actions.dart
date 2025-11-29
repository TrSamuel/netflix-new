import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/newhot_page/everyone_watch/everyone_watch_action_btn.dart';

class TitleAndActions extends StatelessWidget {
  const TitleAndActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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
          EveryoneWatchActionBtn(
            icon: Icons.share_outlined,
            label: 'Share',
          ),
          SizedBox(width: 20),
          EveryoneWatchActionBtn(icon: Icons.check, label: 'My List'),
          SizedBox(width: 20),
          EveryoneWatchActionBtn(icon: Icons.play_arrow, label: 'Play'),
        ],
      ),
    );
  }
}
