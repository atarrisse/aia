import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownStyle {
  MarkdownStyleSheet _stylesheet;

  /// define singleton
  static final MarkdownStyle _instance = MarkdownStyle._internal();
  MarkdownStyle._internal();
  factory MarkdownStyle(BuildContext context) {
    _instance._stylesheet = MarkdownStyleSheet(
      blockSpacing: 20,
      h1: Theme.of(context).textTheme.headline1,
      h2: Theme.of(context).textTheme.headline2,
      h3: Theme.of(context).textTheme.headline3,
      h4: Theme.of(context).textTheme.headline4,
      p: Theme.of(context).textTheme.bodyText1,
      blockquote: Theme.of(context).textTheme.bodyText2.copyWith(height: 1.75),
      blockquoteDecoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
    );
    return _instance;
  }

  MarkdownStyleSheet get styles {
    return this._stylesheet;
  }
}
