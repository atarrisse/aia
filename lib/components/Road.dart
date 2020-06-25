import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart' as ColorConstants;

class Road extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1024 / 800,
      child: Container(
        color: ColorConstants.brownLand,
        child: FlareActor(
          "assets/flare/road.flr",
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
          animation: "cars",
        ),
      ),
    );
  }
}
