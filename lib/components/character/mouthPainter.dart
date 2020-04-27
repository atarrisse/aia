import 'dart:math';
import 'package:flutter/material.dart';

enum MouthMood { open, smile, closed, sad }

class MouthPainter extends CustomPainter {
  Paint _paint;
  double height;
  MouthMood mood;

  MouthPainter({this.height, this.mood}) {
    _paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = this.height * (10 / 62)
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double yOffset = this.mood == MouthMood.sad ? this.height / 2 : 0.0;
    Rect mouth = Offset(0.0, yOffset) & Size(this.height, this.height);
    switch (this.mood) {
      case MouthMood.closed:
        {
          canvas.drawLine(Offset(0.0, this.height / 2),
              Offset(this.height, this.height / 2), _paint);
        }
        break;
      case MouthMood.sad:
        {
          canvas.drawArc(mouth, 0, -pi, false, _paint);
        }
        break;
      case MouthMood.smile:
        {
          canvas.drawArc(mouth, 0, pi, false, _paint);
        }
        break;
      case MouthMood.open:
        {
          canvas.drawArc(mouth, 0, 2 * pi, false, _paint);
        }
        break;
      default:
        {
          canvas.drawArc(mouth, 0, pi, false, _paint);
        }
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
