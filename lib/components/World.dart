import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class World extends StatelessWidget {
  final double radius;
  World({this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.radius,
        width: this.radius,
        child: FlareActor("assets/flare/world.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "clouds"));
  }
}
