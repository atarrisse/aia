import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:aia/components/character/character.dart';

class CharacterAnimation extends StatefulWidget {
  @override
  _CharacterAnimationState createState() => _CharacterAnimationState();
}

class _CharacterAnimationState extends State<CharacterAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animCtrl;
  Animation<double> animation;

  @override
  initState() {
    super.initState();

    animCtrl = AnimationController(duration: Duration(seconds: 2), vsync: this);
    final curvedAnimation = CurvedAnimation(
        parent: animCtrl, curve: Curves.bounceIn, reverseCurve: Curves.easeOut);

    animation = Tween<double>(begin: 0, end: math.pi).animate(curvedAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animCtrl.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animCtrl.forward();
        }
      });
    animCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return RotatingTransition(
      angle: animation,
      child: Character(mood: CharacterMood.glad),
    );
  }
}

class RotatingTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> angle;

  const RotatingTransition({@required this.angle, @required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      child: child,
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: angle.value,
          child: child,
        );
      },
    );
  }
}
