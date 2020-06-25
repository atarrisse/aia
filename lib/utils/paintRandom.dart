import 'dart:math' as math;
import 'package:aia/components/Star.dart';
import 'package:flutter/material.dart';

paintRandom({int count: 100, double width, double height}) {
  final randomizer = new math.Random();

  var randoms = <Widget>[];
  int counter = 0;
  while (counter < count) {
    final left = randomizer.nextDouble() * width;
    final top = randomizer.nextDouble() * height;
    randoms.add(Positioned(left: left, top: top, child: Star()));
    counter++;
  }
  return randoms;
}
