import 'package:flutter/material.dart';
import 'package:aia/components/ModalTrigger.dart';
import 'package:aia/components/Section.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext rootContext) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Home"),
          ),
          body: Stack(
            children: <Widget>[
              SafeArea(
                minimum: const EdgeInsets.all(16.0),
                child: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: ListView(
                    children: <Widget>[
                      Section(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Titulo",
                            style: Theme.of(rootContext).textTheme.headline1,
                          ),
                          Text(
                              "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.",
                              style: Theme.of(rootContext).textTheme.bodyText1),
                          Text(
                              "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.",
                              style: Theme.of(rootContext).textTheme.bodyText1),
                        ],
                      )),
                      Section(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Titulo",
                            style: Theme.of(rootContext).textTheme.headline2,
                          ),
                          Text(
                              "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.",
                              style: Theme.of(rootContext).textTheme.bodyText1),
                          Text(
                              "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.",
                              style: Theme.of(rootContext).textTheme.bodyText1),
                          Text(
                              "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.",
                              style: Theme.of(rootContext).textTheme.bodyText1),
                        ],
                      )),
                      Section(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Titulo",
                            style: Theme.of(rootContext).textTheme.headline2,
                          ),
                          Text(
                              "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.",
                              style: Theme.of(rootContext).textTheme.bodyText1),
                          Text(
                              "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.",
                              style: Theme.of(rootContext).textTheme.bodyText1),
                          Text(
                              "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.",
                              style: Theme.of(rootContext).textTheme.bodyText1),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter, // and bottomLeft
                  child: SafeArea(
                    child: Theme(
                        data: Theme.of(rootContext)
                            .copyWith(canvasColor: Colors.transparent),
                        child: ModalTrigger(constraints)),
                  ))
            ],
          ));
    });

    //   builder: (BuildContext context, BoxConstraints constraints) {
    // return Container(
    //   width: constraints.maxWidth,
    //   child: Wrap(
    //     alignment: WrapAlignment.spaceBetween,
    //     runSpacing: 30.0,
    //     children: <Widget>[
    //       Container(
    //         child: CharacterAnimation(),
    //         width: constraints.maxWidth * 0.9,
    //       ),
    //       Container(
    //         child: Character(mood: CharacterMood.astonished),
    //         width: constraints.maxWidth * 0.4,
    //       ),
    //       Container(
    //         child: Character(mood: CharacterMood.expressionless),
    //         width: constraints.maxWidth * 0.4,
    //       ),
    //       Container(
    //         child: Character(mood: CharacterMood.glad),
    //         width: constraints.maxWidth * 0.4,
    //       ),
    //       Container(
    //         child: Character(mood: CharacterMood.happy),
    //         width: constraints.maxWidth * 0.4,
    //       ),
    //       Container(
    //         child: Character(mood: CharacterMood.neutral),
    //         width: constraints.maxWidth * 0.4,
    //       ),
    //       Container(
    //         child: Character(mood: CharacterMood.sad),
    //         width: constraints.maxWidth * 0.4,
    //       ),
    //       Container(
    //         child: Character(mood: CharacterMood.unamused),
    //         width: constraints.maxWidth * 0.4,
    //       ),
    //       Container(
    //         child: Character(mood: CharacterMood.wink),
    //         width: constraints.maxWidth * 0.4,
    //       ),
    //     ],
    //   ),
    //   padding: EdgeInsets.all(20),
    // );
    //   },
    // ),
  }
}
