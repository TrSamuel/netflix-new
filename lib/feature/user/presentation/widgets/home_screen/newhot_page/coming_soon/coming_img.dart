import 'package:flutter/material.dart';

class ComingImg extends StatelessWidget {
  const ComingImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: .circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://image.tmdb.org/t/p/original/73oKTGsw2kf03G5BRSX1pOCFwIn.jpg',
          ),
        ),
      ),
    );
  }
}
