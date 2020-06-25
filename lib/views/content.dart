import 'package:aia/theme/markdown.dart';
import 'package:flutter/material.dart';
import 'package:aia/model/contentArguments.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:slugify/slugify.dart';

class Content extends StatelessWidget {
  static const routeName = '/content';

  @override
  Widget build(BuildContext context) {
    final ContentArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: rootBundle.loadString("content/${Slugify(args.subject)}.md"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              data: snapshot.data,
              styleSheet: MarkdownStyle(context).styles,
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }
}
