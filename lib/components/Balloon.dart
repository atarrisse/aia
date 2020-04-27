import 'package:flutter/material.dart';
import 'package:aia/model/sender.dart';

class Balloon extends StatelessWidget {
  Balloon({@required this.sender, @required this.text});

  final SENDER sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          sender == SENDER.user ? Alignment.centerRight : Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Container(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: Color.fromRGBO(255, 255, 255, 1.0),
          ),
          margin: EdgeInsets.only(bottom: 16.0),
          padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
