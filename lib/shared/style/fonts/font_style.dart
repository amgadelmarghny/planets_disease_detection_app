import 'package:flutter/material.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';

abstract class FontsClass {
  static const TextStyle font24bold = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle font32bold = TextStyle(
    color: defaultColor,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
}
