import 'package:flutter/material.dart';

class CustomColorScheme {
// final Color blueDark = Color.fromRGBO(0, 0, 68, 1.0);
// final Color blueLight = Color.fromRGBO(129, 204, 204, 1.0);
// final Color greyDark = Color.fromRGBO(102, 102, 102, 1.0);
// final Color grey = Color.fromRGBO(230, 230, 230, 1.0);
// final Color white = Color.fromRGBO(255, 255, 255, 1.0);

  static final CustomColorScheme _colors = new CustomColorScheme._internal();
  CustomColorScheme._internal();
  factory CustomColorScheme() => _colors;

  Color get blueDark => Color.fromRGBO(0, 0, 68, 1.0);
  Color get blueLight => Color.fromRGBO(129, 204, 204, 1.0);
  Color get greyDark => Color.fromRGBO(102, 102, 102, 1.0);
  Color get grey => Color.fromRGBO(230, 230, 230, 1.0);
  Color get white => Color.fromRGBO(255, 255, 255, 1.0);

  Color get ballonBg => white;
}
