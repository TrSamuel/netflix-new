import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';
import 'package:netflixclonenew/feature/user/domain/entities/movie/movie_details.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/cast_details_screens/data_name.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/cast_details_screens/field_type_d.dart';
import 'package:netflixclonenew/feature/user/presentation/widgets/cast_details_screens/maturity_rating_d.dart';

class CastDetailsScreenMovie extends StatelessWidget {
  final MovieDetails movieDetails;
  const CastDetailsScreenMovie({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    final kHeight = SizedBox(height: 30);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.darkGrey,
        title: Text(movieDetails.title),
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
              kHeight,
              FieldTypeD(label: 'Cast'),
              ...List.generate(
                movieDetails.casts.length < 10 ? movieDetails.casts.length : 10,
                (index) => DataName(label: movieDetails.casts[index]),
              ),
              kHeight,
              FieldTypeD(label: 'Director'),
              DataName(label: movieDetails.director),
              kHeight,
              FieldTypeD(label: 'Writers'),
              ...List.generate(
                movieDetails.writers.length < 10
                    ? movieDetails.writers.length
                    : 10,
                (index) => DataName(label: movieDetails.writers[index]),
              ).toSet(),
              kHeight,
              if (movieDetails.maturityRating.isNotEmpty)
                FieldTypeD(label: 'Maturity Rating'),
              if (movieDetails.maturityRating.isNotEmpty)
                MaturityRatingD(maturityRating: movieDetails.maturityRating),
              if (movieDetails.maturityRating.isNotEmpty) kHeight,
              FieldTypeD(label: 'Genres'),
              ...List.generate(
                movieDetails.genres.length < 10
                    ? movieDetails.genres.length
                    : 10,
                (index) => DataName(label: movieDetails.genres[index]),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
