import 'package:flutter/material.dart';
import 'package:aia/components/Balloon.dart';
import 'package:aia/model/watsonResponse.dart';
import 'package:aia/model/sender.dart';

abstract class Message {
  Message._();

  Widget getWidget(context);

  factory Message(Map<String, dynamic> json) {
    Sender sender = json["sender"];
    var message;

    switch (sender) {
      case Sender.user:
        message = new UserMessage(json);
        break;
      default:
        throw Exception("Message sneder $sender has not been contemplated");
    }
    return message;
  }
}

class UserMessage extends Message {
  final message;
  Sender sender;
  String content;

  UserMessage(this.message) : super._() {
    this.sender = Sender.user;
    this.content = this.message["content"];
  }

  @override
  Widget getWidget(context) {
    return Balloon(
        sender: this.sender,
        content: Text(
          this.content,
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }
}

class WatsonMessage extends Message {
  final message;
  Sender sender;
  WatsonResponse content;

  WatsonMessage(this.message) : super._() {
    this.sender = Sender.watson;
    this.content = this.message["content"];
  }

  @override
  Widget getWidget(context) {
    return Balloon(sender: this.sender, content: this.content.getWidget());
  }
}
