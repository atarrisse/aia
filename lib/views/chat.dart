import 'package:aia/model/events.dart';
import 'package:flutter/material.dart';
import 'package:aia/components/Chat/ChatFooter.dart';
import 'package:aia/model/message.dart';
import 'package:aia/model/watson.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController msgController = TextEditingController();
  List<Message> messages = [];
  bool _isLoading = false;

  Watson watson = Watson();

  @override
  void initState() {
    super.initState();
    watson.initWatson();
    eventBus.on<WatsonSelectedOption>().listen((event) {
      messages.add(UserMessage({"content": event.option["label"]}));
    });
    eventBus.on<WatsonReceiveMessage>().listen((event) {
      this._receiveMessage(event);
    });
  }

  _sendMessage(input) {
    messages.add(UserMessage({"content": input}));
    this.setState(() {
      _isLoading = true;
    });
    watson.sendMessage(msgController.text);
    msgController.clear();
  }

  _receiveMessage(response) {
    this.setState(() {
      _isLoading = false;
    });
    List<dynamic> watsonResponse = response.message;
    watsonResponse.forEach((item) {
      messages.add(WatsonMessage({"content": item}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Chatbot"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return messages[index].getWidget(context);
                      }),
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              ChatFooter(
                  controller: msgController,
                  handleSubmit: () {
                    _sendMessage(msgController.text);
                  })
            ],
          ),
        ));
  }

  @override
  void dispose() {
    watson.deleteWatsonSession();
    msgController.dispose();
    super.dispose();
  }
}
