import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';
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
            Row(
              children: [
                Container(
                  width: size.width * 0.2,
                  height: 300,
                  color: TestAppconst.widgetTestcolor,
                  child: Column(children: [Text("DEC"), Text("25")]),
                ),
                Container(
                  width: size.width * 0.8,
                  height: 300,
                  color: Colors.deepOrange,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/original/73oKTGsw2kf03G5BRSX1pOCFwIn.jpg',
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text("Title"),
                          Column(
                            children: [
                              Icon(Icons.notifications_outlined),
                              Text("Remind Me"),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.info),
                              Text("Info"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
