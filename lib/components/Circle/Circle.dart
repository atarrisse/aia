import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'CirclePainter.dart';

class Circle extends StatefulWidget {
  final randomizer = new Random();
  final double x;
  final double y;
  final double radius;
  final bool pulse;
  final Color color;

  Circle({this.radius, this.x, this.y, this.color, this.pulse});

  _StarState createState() => _StarState();
}

class _StarState extends State<Circle> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  double fraction = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.radius > 1.5 && widget.pulse) {
      controller =
          AnimationController(duration: Duration(seconds: 1), vsync: this);
      animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
        ..addListener(() {
          this.setState(() {
            this.fraction = animation.value;
          });
        });
      Timer(Duration(milliseconds: widget.randomizer.nextInt(1000)), () {
        controller.repeat(reverse: true);
      });
    } else {
      this.setState(() {
        this.fraction = 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
          painter: CirclePainter(
              x: widget.x,
              y: widget.y,
              radius: widget.radius * this.fraction,
              color: widget.color)),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
