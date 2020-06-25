import 'dart:convert';

import 'package:aia/theme/watsonResponse.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import 'events.dart';

abstract class WatsonResponse {
  WatsonResponse._();

  Widget getWidget();

  factory WatsonResponse(Map<String, dynamic> json, [String intent]) {
    if (intent == "sazonalidade") {
      return new WatsonResponseSeasonality(json);
    }
    String responseType = json["response_type"];
    var response;
    switch (responseType) {
      case 'text':
        response = new WatsonResponseText(json);
        break;
      case 'option':
        response = new WatsonResponseOption(json);
        break;
      case 'suggestion':
        print(json);
        // response = new WatsonResponseOption(json);
        break;
      case 'image':
        response = new WatsonResponseImage(json);
        break;
      default:
        throw Exception(
            "Watson response type $responseType has not been contemplated");
    }
    return response;
  }
}

class WatsonResponseText extends WatsonResponse {
  final content;
  String text;

  WatsonResponseText(this.content) : super._() {
    this.text = this.content["text"];
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget getWidget() {
    return Html(
      data: """
        ${this.text}
      """,
      onLinkTap: (url) {
        this._launchURL(url);
      },
    );
  }
}

class WatsonResponseOption extends WatsonResponse {
  final content;
  String title;
  List options;

  WatsonResponseOption(this.content) : super._() {
    this.title = this.content["title"];
    this.options = this.content["options"];
  }

  List getOptions() {
    List optionsWidgets = [];
    for (var option in this.options) {
      optionsWidgets.add(TextSpan(
          text: "${option["label"]}\n",
          style: WatsonStyle.watsonOptionButtonStyle,
          recognizer: new TapGestureRecognizer()
            ..onTap = () {
              eventBus.fire(WatsonSelectedOption(option));
            }));
    }
    return optionsWidgets;
  }

  @override
  Widget getWidget() {
    return RichText(
      text: TextSpan(
          style: WatsonStyle.watsonOptionLabelStyle,
          children: <TextSpan>[
            TextSpan(text: "${this.title}\n\n"),
            ...getOptions()
          ]),
    );
  }
}

class WatsonResponseImage extends WatsonResponse {
  final content;
  String source;

  WatsonResponseImage(this.content) : super._() {
    this.source = this.content["source"];
  }

  @override
  Widget getWidget() {
    return Image(
      image: NetworkImage(this.source),
    );
  }
}

class WatsonResponseSeasonality extends WatsonResponse {
  final content;
  List foods = [];
  var widgets = [];

  WatsonResponseSeasonality(this.content) : super._() {
    String responseType = this.content["response_type"];
    print(this.content);

    if (responseType == 'option') {
      widgets.add(WatsonResponseOption(this.content).getWidget());
    }

    if (responseType == 'text') {
      try {
        this.foods = json.decode(this.content["text"])["result"];
        this.getFoods();
      } catch (e) {
        if (e is FormatException) {
          widgets.add(WatsonResponseText(this.content).getWidget());
        }
      }
    }
  }

  void getFoods() {
    List<Widget> foodsWidgets = [];
    for (var food in this.foods) {
      foodsWidgets.add(Column(
        children: <Widget>[
          Image(image: NetworkImage(food["imagem"])),
          Text(food["alimento"])
        ],
      ));
    }
    this.widgets.add(Row(
          children: <Widget>[...foodsWidgets],
        ));
  }

  @override
  Widget getWidget() {
    return Column(
      children: <Widget>[...this.widgets],
    );
  }
}
