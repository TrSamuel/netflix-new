import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const .all(8.0),
        child: Image.asset('assets/logo/netflixlogo.png'),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.download)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }
}
