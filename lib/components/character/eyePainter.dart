import 'dart:math';
import 'package:flutter/material.dart';

enum EyeMood { closed, lid, open, smile }

class EyePainter extends CustomPainter {
  Paint _paint;
  double height;
  double eyeStrokeWidth;
  EyeMood mood;

  EyePainter({this.height, this.mood}) {
    _paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = this.height * (10 / 62)
      ..style = PaintingStyle.stroke;
  }

  _getMoodedEye(Rect eye, Canvas canvas) {
    switch (this.mood) {
      case EyeMood.closed:
        {
          canvas.drawLine(Offset(0.0, this.height / 2),
              Offset(this.height, this.height / 2), _paint);
        }
        break;
      case EyeMood.lid:
        {
          canvas.drawLine(Offset(0.0, this.height / 2),
              Offset(this.height, this.height / 2), _paint);
          canvas.drawArc(eye, 0, 2 * pi, false, _paint);
        }
        break;
      case EyeMood.smile:
        {
          canvas.drawArc(eye, 0, -pi, false, _paint);
        }
        break;
      case EyeMood.open:
        {
          canvas.drawArc(eye, 0, 2 * pi, false, _paint);
        }
        break;
      default:
        throw ("Eye need some mood");
        break;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect eye = Offset(0.0, 0.0) & Size(this.height, this.height);
    this._getMoodedEye(eye, canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
