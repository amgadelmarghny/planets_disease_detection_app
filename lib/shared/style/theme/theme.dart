import 'package:flutter/material.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';

abstract class ThemeApp {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xff209748),
          fontWeight: FontWeight.w600,
          fontSize: 36,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: fontColor,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: fontColor,
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
      ), //primary color
    );
  }
}
