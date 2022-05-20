import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';

class ButtonStop extends StatelessWidget {
  ButtonStop(this.function);
  final void Function() function;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: function,
        child: Text(
          'Stop',
          style: TextStyle(color: BUTTON_PRIMARY_TEXT, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(left: 60, top: 20, bottom: 20, right: 60),
            primary: BUTTON_CANCEL,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180))),
      );
}
