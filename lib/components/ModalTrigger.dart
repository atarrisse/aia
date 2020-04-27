import 'package:flutter/material.dart';
import 'package:aia/components/ModalGettingTo.dart';

class ModalTrigger extends StatelessWidget {
  final constraints;

  ModalTrigger(this.constraints);

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ModalGeettingTo();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        _showModalBottomSheet(context);
      },
      fillColor: Colors.teal,
      constraints: BoxConstraints(
          minHeight: 50, minWidth: this.constraints.maxWidth - 20.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      textStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'OpenSans',
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      child: Text('Getting to!'),
    );
  }
}
