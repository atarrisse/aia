import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aia/model/watsonResponse.dart';
import 'package:aia/model/secretLoader.dart';

import 'events.dart';

class Watson {
  /// define singleton
  static final Watson _secrets = new Watson._internal();
  Watson._internal();
  factory Watson() => _secrets;

  final String platform = 'watsonAssistant';
  Secrets secrets = Secrets();

  String _assistantId;
  String _auth;
  String _query;
  String _url;
  DateTime _sessionTimestamp;
  String _sessionID;
  final int sessionTimeoutMinutes = 5;

  void initWatson() async {
    _setWatsonAuth();
    var params = {'version': await secrets.getSecret(platform, 'version')};
    _assistantId = await secrets.getSecret(platform, 'assistantID');
    _query = params.entries.map((p) => '${p.key}=${p.value}').join('&');
    _url = await secrets.getSecret(platform, 'url');
    _createWatsonSession();

    eventBus.on<WatsonSelectedOption>().listen((event) {
      this.sendMessage(event.option["value"]["input"]["text"]);
    });
  }

  void _setWatsonAuth() async {
    String _username = 'apikey';
    String password = await secrets.getSecret(platform, 'apiKey');
    _auth = 'Basic ' + base64Encode(utf8.encode('$_username:$password'));
  }

  Future<void> _createWatsonSession() async {
    http.Response res = await http.post(
        '$_url/v2/assistants/$_assistantId/sessions?$_query',
        headers: {'Authorization': _auth});

    if (res.statusCode < 200 || res.statusCode > 299)
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    if (res.statusCode == 201) print("✅ session created");
    _sessionTimestamp = DateTime.now();
    _sessionID = json.decode(res.body)['session_id'];
  }

  Future<void> _checkIfSessionHasTimedout() async {
    var current = DateTime.now();
    var timeDifference = current.difference(_sessionTimestamp).inMinutes;

    if (timeDifference >= sessionTimeoutMinutes) {
      print("The time difference is $timeDifference minutes");
      print("Let's restart the session!");
      deleteWatsonSession();
      await _createWatsonSession();
    }
  }

  void sendMessage(String input) async {
    await _checkIfSessionHasTimedout();

    var data = '{"input": {"text": "$input"}}';
    var res = await http.post(
        '$_url/v2/assistants/$_assistantId/sessions/$_sessionID/message?$_query',
        headers: {'Content-Type': 'application/json', 'Authorization': _auth},
        body: data);

    if (res.statusCode == 400) {
      print("Oops, seems session has expired. Let's rety!");
    }

    if (res.statusCode != 200)
      throw Exception('http.post error: statusCode= ${res.statusCode}');

    final jsonRes = json.decode(res.body)["output"];
    List<String> intents = [];
    jsonRes["intents"].forEach((item) => intents.add(item["intent"]));

    final generic = jsonRes["generic"];
    List response = [];
    for (var item in generic) {
      if (intents.isEmpty) {
        response.add(WatsonResponse(item));
      } else {
        response.add(WatsonResponse(item, intents[0]));
      }
    }
    eventBus.fire(WatsonReceiveMessage(response));
  }

  void deleteWatsonSession() async {
    var res = await http.delete(
        '$_url/v2/assistants/$_assistantId/sessions?$_query',
        headers: {'Authorization': _auth});
    print(res);
    print(res.statusCode);
    print(res.body);
  }
}
