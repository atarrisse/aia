import 'package:flutter/material.dart';
import 'package:aia/components/character/character.dart';

class ModalGeettingToContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: 100.0,
            margin: EdgeInsets.only(bottom: 15.0),
            child: Character(mood: CharacterMood.happy)),
        Text(
          "Hi! I'm XXX.",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          width: 300,
          child: Text(
            "It'd be my pleasure to help you out if you have further questions.",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/chat');
            },
            child: Text("That would be lovely"),
          ),
        )
      ],
    );
  }
}

class ModalGeettingTo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30.0),
        height: 300,
        decoration: BoxDecoration(
          color: Colors.teal[400],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
              textTheme: TextTheme(
            headline5: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white),
            bodyText1: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white),
          )),
          child: ModalGeettingToContent(),
        ));
  }
}
