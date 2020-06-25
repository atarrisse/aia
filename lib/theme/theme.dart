import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData buildTheme() {
    ThemeData base = ThemeData();
    return base.copyWith(
        backgroundColor: Colors.grey[200],
        accentColor: Colors.grey[700],
        primaryColor: Colors.grey[700],
        textTheme: TextTheme(
          bodyText1: base.textTheme.bodyText1.copyWith(
              color: Colors.grey[850],
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.25),
          bodyText2: base.textTheme.bodyText1.copyWith(fontSize: 14),
          headline1: TextStyle(
              color: Colors.grey[850],
              decoration: TextDecoration.none,
              fontSize: 40,
              fontWeight: FontWeight.w200,
              height: 1.25),
          headline2: TextStyle(
              color: Colors.grey[850],
              decoration: TextDecoration.none,
              fontSize: 35,
              fontWeight: FontWeight.w400,
              letterSpacing: -2,
              height: 1),
          headline3: TextStyle(
              color: Colors.grey[850],
              decoration: TextDecoration.none,
              fontSize: 30,
              fontWeight: FontWeight.w400,
              height: 1.25),
        ));
  }
}
