import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final handleTap;

  const SendButton({Key key, this.handleTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          color: Theme.of(context).primaryColor,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(left: 8.0),
        child: Icon(Icons.send, color: Theme.of(context).backgroundColor),
      ),
    );
  }
  //   return GestureDetector(
  //     onTap: handleTap,
  //     child: Container(
  //       padding: EdgeInsets.all(8.0),
  //       child: Row(
  //         children: <Widget>[
  //           Flexible(
  //             child: TextField(
  //               autofocus: true,
  //               controller: controller,
  //             ),
  //           ),
  //           Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.all(Radius.circular(50.0)),
  //               color: Theme.of(context).primaryColor,
  //             ),
  //             alignment: Alignment.center,
  //             padding: EdgeInsets.all(8.0),
  //             margin: EdgeInsets.only(left: 8.0),
  //             child: Icon(Icons.send, color: Theme.of(context).backgroundColor),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
