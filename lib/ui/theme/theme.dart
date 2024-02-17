import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.white;
  static const Color accentColor1 = Color(0xFF80DEEA);
  static const Color accentColor2 = Color(0xFF5EB5FF);
  static const Color textColor = Colors.white;
  static const Color textShadowColor = Colors.black;
}

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(

        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(

        ),
      ),
    );
  }
}