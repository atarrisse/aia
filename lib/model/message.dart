import 'package:flutter/material.dart';
import 'package:aia/model/sender.dart';

class Message {
  Message({@required this.content, @required this.sender}) {
    this.timestamp = DateTime.now();
  }

  final String content;
  final SENDER sender;
  DateTime timestamp;

  @override
  String toString() {
    return '$sender: $content';
  }

  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}
