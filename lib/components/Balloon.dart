import 'package:flutter/material.dart';
import 'package:aia/model/sender.dart';

class Balloon extends StatelessWidget {
  Balloon({@required this.sender, @required this.content});

  final Sender sender;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          sender == Sender.user ? Alignment.centerRight : Alignment.centerLeft,
      child: FractionallySizedBox(
          widthFactor: 0.9,
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.black),
            child: Container(
              child: this.content,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Color.fromRGBO(255, 255, 255, 1.0),
              ),
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(8.0),
            ),
          )),
    );
  }
}
