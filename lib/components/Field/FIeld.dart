import 'dart:math' as math;
import 'package:aia/components/Duck.dart';
import 'package:flutter/material.dart';
import 'FieldPainter.dart';

const Color greenLand = Color.fromRGBO(0, 190, 122, 1.0);

class Field extends StatelessWidget {
  final int plantCount = 30;
  final double screenProportionField = 0.4;
  final randomizer = new math.Random();

  Field();

  @override
  Widget build(BuildContext context) {
    return Container(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: <Widget>[
          Image(image: AssetImage('assets/images/field.png')),
          Container(
            height: screenProportionField * MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: FieldPainter(constraints: constraints),
            ),
          ),
          Positioned(
            left: 50,
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/onboarding');
                },
                child: Transform(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    child: Duck(),
                  ),
                  transform: Matrix4.rotationY(math.pi),
                )),
          ),
        ],
      );
    }));
  }
}
