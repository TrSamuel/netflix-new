import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

class NavigatorPage {
  static void goTo(Widget page, BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, _, _) => page,
        transitionDuration: Duration(milliseconds: 300),
        opaque: true,
        barrierColor: AppColors.black,
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}
