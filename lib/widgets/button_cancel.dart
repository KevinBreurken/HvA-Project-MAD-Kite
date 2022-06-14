import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';

class ButtonCancel extends StatelessWidget {
  const ButtonCancel(this.function);
  final void Function() function;

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        onPressed: function,
        label: Text(
          'Cancel',
          style: TextStyle(color: BUTTON_CANCEL, fontSize: 20),
        ),
        icon: Icon(
          Icons.close,
          color: BUTTON_CANCEL,
        ),
        style: ElevatedButton.styleFrom(
            side: BorderSide(width: 3, color: BUTTON_CANCEL),
            padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 30),
            primary: DARK_BACKGROUND_PRIMARY,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180))),
      );
}
