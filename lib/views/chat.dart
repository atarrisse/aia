import 'package:flutter/material.dart';
import 'package:aia/components/Balloon.dart';
import 'package:aia/model/message.dart';
import 'package:aia/model/sender.dart';
import 'package:aia/model/watsonResponse.dart';
import 'package:aia/model/watson.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final msgController = TextEditingController();
  List<WatsonResponse> messages = List<WatsonResponse>();
  List<Message> texts = List<Message>();

  Watson watson = Watson();
  String _text;
  bool _isLoading = false;

  _sendMessage() async {
    setState(() {
      _isLoading = true;
    });
    print("sending: ${msgController.text}");
    texts.add(Message(content: msgController.text, sender: SENDER.user));
    WatsonResponse watsonResponse =
        await watson.sendMessage(msgController.text);
    messages.add(watsonResponse);
    texts.add(
        Message(content: watsonResponse.toString(), sender: SENDER.watson));
    setState(() {
      _isLoading = false;
      _text = watsonResponse.toString();
    });
    print(messages);
    msgController.clear();
  }

  @override
  void initState() {
    super.initState();
    watson.initWatson();
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
                      itemCount: texts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Balloon(
                            sender: texts[index].sender,
                            text: texts[index].content);
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
              GestureDetector(
                onTap: _sendMessage,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          autofocus: true,
                          controller: msgController,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          color: Theme.of(context).primaryColor,
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.send,
                            color: Theme.of(context).backgroundColor),
                      ),
                    ],
                  ),
                ),
              ),
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
