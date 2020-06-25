import 'package:aia/components/Chat/SendButton.dart';
import 'package:flutter/material.dart';

class ChatFooter extends StatelessWidget {
  final TextEditingController controller;
  final handleSubmit;

  const ChatFooter({Key key, this.controller, this.handleSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
                autofocus: true,
                controller: controller,
                style: TextStyle(color: Colors.black),
                onSubmitted: (value) {
                  handleSubmit();
                }),
          ),
          SendButton(handleTap: handleSubmit),
        ],
      ),
    );
  }
}
