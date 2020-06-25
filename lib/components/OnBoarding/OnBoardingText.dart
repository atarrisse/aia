import 'package:flutter/material.dart';
import '../../constants/layout.dart' as LayoutConstants;

class OnBoardingText extends StatelessWidget {
  final double initial;
  final double variable;
  final List<String> content = ["Olá", "Como eu posso lhe ajudar?"];
  OnBoardingText(this.initial, this.variable);

  getContent() {
    List<Widget> _content = [];
    for (String item in content) {
      _content.add(Text(
        item,
        style: LayoutConstants.displayStyle,
      ));
    }
    return _content;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 300),
        top: this.initial * this.variable,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: this.getContent(),
          ),
        ));
  }
}
