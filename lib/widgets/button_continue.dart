import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';

class ButtonContinue extends StatelessWidget {
  const ButtonContinue(this.text, this.function);
  final String text;
  final void Function() function;

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        onPressed: function,
        label: Text(
          text,
          style: TextStyle(color: BUTTON_PRIMARY_TEXT, fontSize: 20),
        ),
        icon: Icon(
          Icons.check,
          color: BUTTON_PRIMARY_TEXT,
        ),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 30),
            primary: BUTTON_PRIMARY,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180))),
      );
}
