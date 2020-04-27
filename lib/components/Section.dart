import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget child;

  const Section({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 20.0), child: child);
  }
}
