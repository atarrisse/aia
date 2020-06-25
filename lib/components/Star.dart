import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

const double minRadius = 0.5;
const double maxRadius = 3.0;

class Star extends StatefulWidget {
  final randomizer = new math.Random();
  double radius;
  int delay;
  int duration;

  Star() {
    this.radius = randomizer.nextDouble() * (maxRadius - minRadius) + minRadius;
    this.delay = randomizer.nextInt(1000);
    this.duration = randomizer.nextInt(1000);
  }

  @override
  _StarState createState() => _StarState();
}

class _StarState extends State<Star> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double _fraction = 1.0;

  void initState() {
    super.initState();
    this.controller = AnimationController(
        duration: Duration(seconds: widget.duration), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        this.setState(() {
          this._fraction = animation.value;
        });
      });
    Timer(Duration(milliseconds: widget.delay), () {
      controller.repeat(reverse: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius * 2),
        color: Colors.white,
      ),
      height: widget.radius,
      width: widget.radius,
      // duration: Duration(milliseconds: widget.duration),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
