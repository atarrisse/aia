import 'package:flutter/material.dart';
import '../constants/colors.dart' as ColorConstants;
import '../components/River.dart';
import '../components/Road.dart';
import '../components/NightSky.dart';
import '../components/Field/Field.dart';

class Home extends StatelessWidget {
  final double gradientHeight = 0.4;
  @override
  Widget build(BuildContext rootContext) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
          body: Container(
              child: ListView(children: <Widget>[
        NightSky(),
        SizedBox(
            height: MediaQuery.of(context).size.height * gradientHeight,
            width: double.infinity,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorConstants.blueNight, ColorConstants.blueDay],
            )))),
        Field(),
        River(),
        Road(),
      ])));
    });
  }
}
