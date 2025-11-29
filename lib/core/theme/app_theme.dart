import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';
import 'package:netflixclonenew/core/utils/const/appfont_sizes.dart';

class AppTheme {
  static ThemeData data = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(
      bodyLarge: buildThemeTxtStyle(),
      bodyMedium: buildThemeTxtStyle(),
      bodySmall: buildThemeTxtStyle(),
      displayLarge: buildThemeTxtStyle(),
      displayMedium: buildThemeTxtStyle(),
      displaySmall: buildThemeTxtStyle(),
      headlineLarge: buildThemeTxtStyle(),
      headlineMedium: buildThemeTxtStyle(),
      headlineSmall: buildThemeTxtStyle(),
      labelLarge: buildThemeTxtStyle(),
      labelMedium: buildThemeTxtStyle(),
      labelSmall: buildThemeTxtStyle(),
      titleLarge: buildThemeTxtStyle(),
      titleMedium: buildThemeTxtStyle(),
      titleSmall: buildThemeTxtStyle(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.grey,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
    ),
    iconTheme: IconThemeData(color: AppColors.white),
    textButtonTheme: TextButtonThemeData(

      style: TextButton.styleFrom(
        iconSize: 20,
        foregroundColor: AppColors.white,
        textStyle: TextStyle(fontSize: AppfontSizes.mediumSmall),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: LinearBorder(),
        iconSize: 20,
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.white,
        textStyle: TextStyle(fontSize: AppfontSizes.medium),
      ),
    ),
  );
  static TextStyle buildThemeTxtStyle() =>
      GoogleFonts.lato(color: AppColors.white);
}
