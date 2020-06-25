import 'dart:math';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  Paint _paint;
  double x;
  double y;
  double radius;
  Color color;

  CirclePainter({this.x, this.y, this.radius, this.color}) {
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect circle = Offset(this.x, this.y) & Size(this.radius, this.radius);
    canvas.drawArc(circle, 0, 2 * pi, false, _paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.radius != radius;
  }
}
