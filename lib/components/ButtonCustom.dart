import 'package:flutter/material.dart';
import '../constants/colors.dart' as ColorConstants;
import '../constants/layout.dart' as LayoutConstants;

List<Color> getGradientColors(context) {
  return [
    context.bg,
    context.bg,
    ColorConstants.lightenColor(context.bg),
    ColorConstants.lightenColor(context.bg),
    context.bg,
    context.bg
  ];
}

List<double> getGradientStops(double fraction) {
  return [
    -0.15 + fraction,
    -0.8 + fraction,
    -0.12 + fraction,
    -0.05 + fraction,
    -0.0 + fraction,
    1.0 + fraction
  ];
}

class ButtonCustom extends StatefulWidget {
  final dynamic bgColor;
  final Function handleClick;
  final String label;

  ButtonCustom({Key key, this.bgColor, this.handleClick, this.label})
      : super(key: key);

  @override
  ButtonCustomState createState() => ButtonCustomState();
}

class ButtonCustomState extends State<ButtonCustom>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  Color bg;
  double _fraction = 0.0;

  void initState() {
    super.initState();
    this.setState(() {
      this.setBgColor();
    });

    this.controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.15).animate(controller)
      ..addListener(() {
        this.setState(() {
          this._fraction = animation.value;
        });
      });
  }

  void shine() {
    this.controller.forward();
  }

  void setBgColor() {
    if (widget.bgColor is Color) {
      this.bg = ColorConstants.getLuminanceDeltaColor(widget.bgColor);
    } else if (widget.bgColor is List<Color>) {
      this.bg = ColorConstants.getLuminanceDeltaColor(
          ColorConstants.getLighterColor(widget.bgColor));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.handleClick,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(LayoutConstants.borderRadius),
            color: this.bg,
            gradient: LinearGradient(
                begin: Alignment(-1.0, -0.5),
                end: Alignment.bottomRight,
                colors: getGradientColors(this),
                stops: getGradientStops(this._fraction))),
        padding: EdgeInsets.symmetric(vertical: 2 * LayoutConstants.spaceUnit),
        child: Text(
          widget.label,
          style: LayoutConstants.btnTextStyle
              .copyWith(color: ColorConstants.getLuminanceOpposite(this.bg)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
