import 'package:flutter/material.dart';

class GoTo {
  static void page(BuildContext context, {required Widget page}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
    );
  }
}
