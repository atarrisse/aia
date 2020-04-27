import 'package:flutter/material.dart';

enum TextCustomStyles { h1, h2, p }

class TextCustom extends StatelessWidget {
  TextCustom({@required this.hierarchy, @required this.content});

  final String content;
  final TextCustomStyles hierarchy;

  final h1Style = TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700);
  final h2Style = TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700);
  final pStyle = TextStyle(fontSize: 16.0);

  _getStyle() {
    switch (this.hierarchy) {
      case TextCustomStyles.h1:
        return h1Style;
        break;
      case TextCustomStyles.h2:
        return h2Style;
        break;
      case TextCustomStyles.p:
        return pStyle;
        break;
    }
  }

  _getMargin() {
    switch (this.hierarchy) {
      case TextCustomStyles.h1:
        return EdgeInsets.only(bottom: 30.0);
        break;
      case TextCustomStyles.h2:
        return EdgeInsets.only(bottom: 25.0);
        break;
      case TextCustomStyles.p:
        return EdgeInsets.only(bottom: 10.0);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: _getMargin(),
        child: Text(
          content,
          style: this._getStyle(),
        ));
  }
}
