import 'package:flutter/material.dart';
import '../../constants/layout.dart' as LayoutConstants;
import '../../constants/colors.dart' as ColorConstants;
import '../../components/ButtonCustom.dart';

class OnBoardingActions extends StatelessWidget {
  final double fraction;
  final int atm;
  final GlobalKey<ButtonCustomState> buttonKey;

  const OnBoardingActions({this.fraction, this.atm, this.buttonKey});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: this.fraction,
      duration: Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              // child: cta,
              child: ButtonCustom(
                key: this.buttonKey,
                bgColor: ColorConstants.sky[this.atm].colors,
                handleClick: () {
                  Navigator.pushNamed(context, '/chat');
                },
                label: "Faça uma pergunta!",
              ),
            ),
            SizedBox(height: 2 * LayoutConstants.spaceUnit),
            Text("ou rola pra baixo pra saber mais")
          ],
        ),
      ),
    );
  }
}
