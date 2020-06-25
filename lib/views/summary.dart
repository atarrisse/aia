import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:aia/model/contentArguments.dart';
import 'package:aia/views/content.dart';
import '../utils/files.dart' as FilesUtils;
import '../constants/regex.dart' as RegexUtils;

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  List<String> summary = [];

  @override
  void initState() {
    super.initState();
    this._getContentLst();
  }

  Future _getContentLst() async {
    final filePaths = await FilesUtils.getFilesInFolder(
        context, RegexUtils.markdownFilesRegex);
    var fileTitles = await FilesUtils.getAllFilesTitles(
        filePaths, RegexUtils.markdownTitleRegex);

    this.setState(() {
      this.summary = fileTitles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView(
        children:
            this.summary.map((item) => SummaryItem(subject: item)).toList(),
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  final String subject;

  const SummaryItem({Key key, this.subject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.pushNamed(
                context,
                Content.routeName,
                arguments: ContentArguments(subject: this.subject),
              )
            },
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[400], width: 1))),
          height: 120,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
              Text(this.subject, style: Theme.of(context).textTheme.headline2),
        ));
  }
}
