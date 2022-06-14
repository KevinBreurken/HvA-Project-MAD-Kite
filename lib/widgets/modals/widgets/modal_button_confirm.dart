import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';

class ModalButtonConfirm extends StatelessWidget {
  const ModalButtonConfirm(this.function);
  final void Function() function;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: function,
        child: Text(
          'Confirm',
          style: TextStyle(color: BUTTON_PRIMARY_TEXT, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 30),
            primary: BUTTON_PRIMARY,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      );
}
