import 'package:flutter/material.dart';
import 'package:netflixclonenew/core/theme/app_colors.dart';

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
  );

  static TextStyle buildThemeTxtStyle() => TextStyle(color: AppColors.white);
}
