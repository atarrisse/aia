import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Secrets {
  /// define singleton
  static final Secrets _secrets = new Secrets._internal();
  Secrets._internal();
  factory Secrets() => _secrets;

  String _filePath = 'assets/secrets.json';
  var secrets;
  var loaded = false;

  Future<void> loadSecrets() async {
    await rootBundle.loadString(_filePath).then((result) {
      secrets = json.decode(result);
      loaded = true;
      print("🔑 secrets have been loaded");
      return true;
    });
  }

  getSecret(String platform, String key) async {
    if (!loaded) {
      await loadSecrets();
    }
    return secrets[platform][key];
  }
}
