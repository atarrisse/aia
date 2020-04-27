class WatsonResponse {
  final response;
  final intents;
  final entities;

  WatsonResponse({this.response, this.intents, this.entities});

  factory WatsonResponse.fromJson(Map<String, dynamic> json) {
    return WatsonResponse(
      response: json['generic'],
      intents: json['intents'],
      entities: json['entities'],
    );
  }

  @override
  String toString() {
    return response[0]['text'];
  }

  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}
