import 'package:flutter/material.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';

abstract class ThemeApp {
  static ThemeData lightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: defaultColor,
            fontWeight: FontWeight.w600,
            fontSize: 36,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: defaultColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(fontSize: 20),
          bodyLarge: TextStyle(
            color: defaultColor,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(fontSize: 0),
          selectedIconTheme: IconThemeData(color: primaryColor, size: 32),
        ) //primary color
        );
  }
}
