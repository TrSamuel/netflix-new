import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/newhot_page/comingSoon/coming_soon.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/newhot_page/new_hot_app_bar.dart';

class NewhotPage extends StatelessWidget {
  const NewhotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomScrollView(
      slivers: [
        NewHotAppBar(size: size),
        SliverList(
          delegate: SliverChildListDelegate([
            IndexedStack(index: 1, children: [ComingSoon(size: size),
            Column(
              children: [
                Container(
                  width: size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(image: NetworkImage(TestAppconst.backdropPath))),
                ),
              ],
            )
            ]),
          ]),
        ),
      ],
    );
  }
}
