import 'package:flutter/material.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/newhot_page/top10_item_new_hot.dart';

class Top10ShowMovie extends StatelessWidget {
  final Size size;
  const Top10ShowMovie({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(10, (index) =>  Top10ItemNewHot(size: size,index: index,),)
      ),
    );
  }
}
