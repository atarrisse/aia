import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart' as ColorConstants;

class River extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1024 / 690,
      child: Container(
        // color: ColorConstants.greenLand,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorConstants.greenLand, ColorConstants.brownLand],
              stops: [0.49, 0.51]),
        ),
        child: FlareActor(
          "assets/flare/river.flr",
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
          animation: "waves",
        ),
      ),
    );
  }
}
