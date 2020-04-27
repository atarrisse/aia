import 'package:flutter/material.dart';
import 'package:aia/components/character/eyePainter.dart';
import 'package:aia/components/character/mouthPainter.dart';

enum CharacterMood {
  astonished,
  happy,
  wink,
  unamused,
  neutral,
  sad,
  glad,
  expressionless
}

class Character extends StatefulWidget {
  const Character({
    Key key,
    this.mood,
  }) : super(key: key);

  final CharacterMood mood;

  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character>
    with SingleTickerProviderStateMixin {
  CharacterMood _mood;
  final double characterProportionHeight = 0.225;
  final double characterProportionWidth = 0.65;
  final double characterProportionStroke = 10 / 62;
  final double characterProportionBorderRadius = 100 / 273;

  @override
  void initState() {
    this.setState(() {
      this._mood = widget.mood;
    });
    super.initState();
  }

  _getCircleDiameter(double height) {
    if (height == null)
      throw ("to get the circle diameter one needs the height of the parent widget");

    return height * this.characterProportionHeight;
  }

  _getLeftEyeMood(double diameter) {
    switch (this._mood) {
      case (CharacterMood.expressionless):
      case (CharacterMood.wink):
        {
          return EyePainter(
            height: _getCircleDiameter(diameter),
            mood: EyeMood.closed,
          );
        }
        break;
      case (CharacterMood.unamused):
        {
          return EyePainter(
            height: _getCircleDiameter(diameter),
            mood: EyeMood.lid,
          );
        }
        break;
      case (CharacterMood.glad):
        {
          return EyePainter(
            height: _getCircleDiameter(diameter),
            mood: EyeMood.smile,
          );
        }
        break;
      default:
        {
          return EyePainter(
            height: _getCircleDiameter(diameter),
            mood: EyeMood.open,
          );
        }
        break;
    }
  }

  _getRightEyeMood(double diameter) {
    switch (this._mood) {
      case (CharacterMood.expressionless):
        {
          return EyePainter(
            height: _getCircleDiameter(diameter),
            mood: EyeMood.closed,
          );
        }
        break;
      case (CharacterMood.unamused):
        {
          return EyePainter(
            height: _getCircleDiameter(diameter),
            mood: EyeMood.lid,
          );
        }
        break;
      case (CharacterMood.glad):
        {
          return EyePainter(
            height: _getCircleDiameter(diameter),
            mood: EyeMood.smile,
          );
        }
        break;
      default:
        {
          return EyePainter(
            height: _getCircleDiameter(diameter),
            mood: EyeMood.open,
          );
        }
        break;
    }
  }

  _getMouthMood(double diameter) {
    switch (this._mood) {
      case (CharacterMood.astonished):
      case (CharacterMood.glad):
      case (CharacterMood.expressionless):
        {
          return MouthPainter(
              height: _getCircleDiameter(diameter), mood: MouthMood.open);
        }
        break;
      case (CharacterMood.happy):
      case (CharacterMood.wink):
        {
          return MouthPainter(
              height: _getCircleDiameter(diameter), mood: MouthMood.smile);
        }
        break;
      case (CharacterMood.neutral):
      case (CharacterMood.unamused):
        {
          return MouthPainter(
              height: _getCircleDiameter(diameter), mood: MouthMood.closed);
        }
        break;
      case (CharacterMood.sad):
        {
          return MouthPainter(
              height: _getCircleDiameter(diameter), mood: MouthMood.sad);
        }
        break;
      default:
        {
          return null;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 366 / 273,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              child: Center(
                  child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: CustomPaint(
                                  painter:
                                      _getLeftEyeMood(constraints.maxHeight),
                                ),
                                height:
                                    _getCircleDiameter(constraints.maxHeight),
                                width:
                                    _getCircleDiameter(constraints.maxHeight)),
                            Container(
                                child: CustomPaint(
                                    painter:
                                        _getMouthMood(constraints.maxHeight)),
                                height:
                                    _getCircleDiameter(constraints.maxHeight),
                                width:
                                    _getCircleDiameter(constraints.maxHeight)),
                            Container(
                                child: CustomPaint(
                                  painter:
                                      _getRightEyeMood(constraints.maxHeight),
                                ),
                                height:
                                    _getCircleDiameter(constraints.maxHeight),
                                width:
                                    _getCircleDiameter(constraints.maxHeight)),
                          ]),
                      height: _getCircleDiameter(constraints.maxHeight),
                      width: constraints.maxWidth * characterProportionWidth)),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          this.characterProportionBorderRadius *
                              constraints.maxHeight),
                      bottomRight: Radius.circular(
                          characterProportionBorderRadius *
                              constraints.maxHeight))),
            );
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
