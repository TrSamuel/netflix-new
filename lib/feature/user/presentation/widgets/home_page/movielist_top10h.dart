import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/core/utils/const/test_appconst.dart';
import 'package:stroke_text/stroke_text.dart';

class MovielistTop10h extends StatelessWidget {
  const MovielistTop10h({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(bottom: 18),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const .only(left: 8),
            child: Text(
              "Top 10 Movies in India Today",
              style: TextStyle(fontSize: AppfontSizes.large, fontWeight: .w900),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: .horizontal,
            child: Row(
              children: .generate(10, (index) {
                return Padding(
                  padding: const .all(5.0),
                  child: Stack(
                    alignment: .bottomLeft,
                    children: [
                      Container(
                        width: 100,
                        height: 85,
                        child: StrokeText(
                          text: '${index + 1}',
                          strokeColor: AppColors.white,
                          textStyle: GoogleFonts.oswald(fontSize: 10,fontWeight: FontWeight.bold),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          strokeWidth: 2,
                          textScaler: TextScaler.linear(9),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: .circular(3),
                            image: DecorationImage(
                              fit: .cover,
                              image: NetworkImage(TestAppconst.img),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
