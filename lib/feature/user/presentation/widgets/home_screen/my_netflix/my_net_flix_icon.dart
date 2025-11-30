import 'package:flutter/material.dart';

class MyNetFlixIcon extends StatelessWidget {
  const MyNetFlixIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: .circular(20),
          image: DecorationImage(
            fit: .cover,
            image: AssetImage('assets/images/mynetflix.jpg'),
          ),
        ),
      ),
    );
  }
}
