import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class TitleAndButtonsComing extends StatelessWidget {
  const TitleAndButtonsComing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("Title",style: TextStyle(fontSize: AppfontSizes.large,fontWeight: FontWeight.bold),),
          Spacer(),
          Column(
            children: [
              Icon(Icons.notifications_outlined),
              Text("Remind Me"),
            ],
          ),
          SizedBox(width: 35,),
          Column(children: [Icon(Icons.info), Text("Info")]),
        ],
      ),
    );
  }
}
