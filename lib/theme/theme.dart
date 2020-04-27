import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData buildTheme() {
    ThemeData base = ThemeData();
    return base.copyWith(
        backgroundColor: Colors.blueGrey[100],
        accentColor: Colors.blueGrey,
        primaryColor: Colors.teal,
        inputDecorationTheme: base.inputDecorationTheme
            .copyWith(labelStyle: TextStyle(color: Colors.black)),
        textTheme: TextTheme(
          bodyText1: base.textTheme.bodyText1.copyWith(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5),
          headline1: base.textTheme.headline1
              .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
          headline2: base.textTheme.headline2
              .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ));
  }
}
