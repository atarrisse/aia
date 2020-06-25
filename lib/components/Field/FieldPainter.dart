import 'dart:math';
import 'package:flutter/material.dart';

const Color greenLand = Color.fromRGBO(0, 190, 122, 1.0);
const Color greenPlant = Color.fromRGBO(0, 180, 114, 1.0);

class FieldPainter extends CustomPainter {
  BoxConstraints constraints;
  final randomizer = new Random();

  FieldPainter({this.constraints});

  _fieldVerticalContraint(x, h, w) {
    return ((-0.15 * h * x) / w) + 0.65 * h;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var x0 = 0.0;
    var y0 = 0.65 * size.height;

    var x1 = 0.4 * size.width;
    var y1 = size.height / 2;

    var x2 = size.width;
    var y2 = 0.5 * size.height;

    var x3 = size.width;
    var y3 = 0.5 * size.height;

    final _fieldPainter = Paint()
      ..color = greenLand
      ..style = PaintingStyle.fill;
    Path path = Path()
      ..moveTo(x0, y0)
      ..cubicTo(x1, y1, x2, y2, x3, y3)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    canvas.drawPath(path, _fieldPainter);

    final _plantPainter = Paint()
      ..color = greenPlant
      ..style = PaintingStyle.fill;
    for (var i = 0; i < 100; i++) {
      final double x = randomizer.nextDouble() * size.width;
      final minY = _fieldVerticalContraint(x, size.height, size.width);
      final double radius = randomizer.nextDouble() * (10.0 - 5.0) + 8.0;
      final double y =
          randomizer.nextDouble() * ((size.height - radius) - minY) + minY;
      Rect circle = Offset(x, y) & Size(radius, radius);
      canvas.drawArc(circle, 0, 2 * pi, false, _plantPainter);
    }
  }

  @override
  bool shouldRepaint(FieldPainter oldDelegate) {
    return oldDelegate != this;
  }
}
