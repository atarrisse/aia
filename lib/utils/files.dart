library files_utils;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<String>> getFilesInFolder(
    BuildContext context, RegExp directoryRegex) async {
  final manifestContent =
      await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);

  final filePaths = manifestMap.keys
      .where((String key) => key.contains(directoryRegex))
      .toList();
  return filePaths;
}

Future<List<String>> getAllFilesTitles(
    List<String> filePaths, RegExp titleRegex) async {
  List<String> fileTitles = [];
  for (var item in filePaths) {
    String title = await getFileTitle(item, titleRegex);
    fileTitles.add(title);
  }
  return fileTitles;
}

Future<String> getFileTitle(String path, RegExp titleRegex) async {
  String data = await rootBundle.loadString(path);
  final markdownTitleLine = titleRegex.firstMatch(data);
  final markdownTitle = markdownTitleLine.group(2);
  return markdownTitle;
}
