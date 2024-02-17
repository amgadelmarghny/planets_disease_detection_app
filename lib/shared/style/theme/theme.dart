import 'package:flutter/material.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';

abstract class ThemeApp {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor, //primary color
    );
  }
}
