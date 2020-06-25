import 'package:flutter/material.dart';
import './theme/theme.dart';
import './views/chat.dart';
import './views/summary.dart';
import './views/content.dart';
import './views/home.dart';
import './views/onboarding.dart';

void main() {
  runApp(MaterialApp(
      title: "Aia",
      theme: CustomTheme.buildTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => Summary(),
        Content.routeName: (context) => Content(),
        // '/': (context) => Content(),
        // '/': (context) => Home(),
        '/onboarding': (context) => OnBoarding(),
        '/chat': (context) => Chat(),
      }));
}
