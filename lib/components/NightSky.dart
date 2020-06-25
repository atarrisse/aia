import 'package:flutter/material.dart';
import '../constants/colors.dart' as ColorConstants;
import '../utils/paintRandom.dart';

import 'World.dart';

class NightSky extends StatelessWidget {
  final int starsCount = 200;
  final double skyHeight = 0.7;
  final double worldWidth = 0.6;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * skyHeight,
      width: double.infinity,
      child: Container(
        color: ColorConstants.blueNight,
        child: Stack(
          children: <Widget>[
            ...paintRandom(
                count: starsCount,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height),
            Center(
              child:
                  World(radius: worldWidth * MediaQuery.of(context).size.width),
            ),
          ],
        ),
      ),
    );
  }
}
