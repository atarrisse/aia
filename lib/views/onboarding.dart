import 'dart:async';

import 'package:flutter/material.dart';
import '../constants/colors.dart' as ColorConstants;
import '../utils/paintRandom.dart';
import '../components/ButtonCustom.dart';
import '../components/OnBoarding/OnBoardingActions.dart';
import '../components/OnBoarding/OnBoardingText.dart';
import '../components/Duck.dart';

List<Widget> getStars(BuildContext context, int hour) {
  // if (hour > 5 && hour < 17) return [];
  return paintRandom(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height);
}

class OnBoarding extends StatefulWidget {
  final GlobalKey<ButtonCustomState> _buttonKey =
      GlobalKey<ButtonCustomState>();
  final GlobalKey<DuckState> _duckKey = GlobalKey<DuckState>();
  final int atm = TimeOfDay.now().hour;

  @override
  State<StatefulWidget> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  double buttonOpacity = 0;
  double textTop = 1;

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      widget._duckKey.currentState.play(DuckAnimations.flap);
      this.setState(() {
        this.textTop = 0.75;
      });
      Timer(Duration(milliseconds: 200), () {
        this.setState(() {
          this.buttonOpacity = 1;
        });
        widget._buttonKey.currentState.shine();
      });
    });

    super.initState();
  }

  void afterBuild(dynamic old) {
    widget._duckKey.currentState.play(DuckAnimations.hello);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild(context));
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: ColorConstants.sky[widget.atm]),
          child: Stack(
            children: <Widget>[
              // ...?getStars(context, widget.atm),
              OnBoardingText(
                  MediaQuery.of(context).size.height * 0.3, this.textTop),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: OnBoardingActions(
                    fraction: this.buttonOpacity,
                    atm: widget.atm,
                    buttonKey: widget._buttonKey),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image(image: AssetImage('assets/images/morro.png')),
                ),
              ),
              Positioned(
                  bottom: 70,
                  right: MediaQuery.of(context).size.width * 0.15,
                  child: GestureDetector(
                    onTap: () {
                      widget._duckKey.currentState.play(DuckAnimations.flap);
                    },
                    child: SizedBox(
                      width: 100,
                      child: Duck(key: widget._duckKey),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
