import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/cast_details_screens/data_name.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/cast_details_screens/field_type_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/cast_details_screens/maturity_rating_d.dart';

class CastDetailsScreenMovie extends StatelessWidget {
  const CastDetailsScreenMovie({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight = SizedBox(height: 30);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.darkGrey,
        title: Text("Strephen"),
        titleTextStyle: TextStyle(
          fontSize: AppfontSizes.xLarge,
          fontWeight: .bold,
        ),
        backgroundColor: AppColors.darkGrey,
        centerTitle: true,
        leading: SizedBox.shrink(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      backgroundColor: AppColors.darkGrey,
      body: SingleChildScrollView(
        child: SizedBox(
          width: .infinity,
          child: Column(
            children: [
              FieldTypeD(label: 'Cast'),
              ...List.generate(
                6,
                (index) => DataName(label: 'cast ${index + 1}'),
              ),
              kHeight,
              FieldTypeD(label: 'Director'),
              DataName(label: 'Mithun'),
              kHeight,
              FieldTypeD(label: 'Writers'),
              ...List.generate(
                6,
                (index) => DataName(label: 'writer ${index + 1}'),
              ),
              kHeight,
              FieldTypeD(label: 'Maturity Rating'),
              MaturityRatingD(),
              kHeight,
              FieldTypeD(label: 'Genres'),
              ...List.generate(
                6,
                (index) => DataName(label: 'genre ${index + 1}'),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
