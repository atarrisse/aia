import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

enum DuckAnimations { eye, flap, hello, idea }
final duckAnimations = const {
  DuckAnimations.eye: 'eye',
  DuckAnimations.hello: 'hello',
  DuckAnimations.flap: 'flap',
  DuckAnimations.idea: 'idea',
};

class Duck extends StatefulWidget {
  const Duck({Key key}) : super(key: key);

  @override
  DuckState createState() => DuckState();
}

class DuckState extends State<Duck> {
  final FlareControls _controls = FlareControls();

  void play(DuckAnimations animation) {
    _controls.play(duckAnimations[animation]);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 900 / 1550,
      child: FlareActor(
        "assets/flare/duck.flr",
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        controller: _controls,
      ),
    );
  }
}
