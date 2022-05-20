import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/widgets/modals/modal_cancel.dart';

class ModalButtonCancel extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () => {Navigator.pop(context)},
        child: Text(
          'Cancel',
          style: TextStyle(color: DARK_PRIMARY_TEXT, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
            side: BorderSide(width: 1, color: DARK_PRIMARY_TEXT),
            padding: EdgeInsets.only(left: 30, top: 20, bottom: 20, right: 30),
            primary: DARK_BACKGROUND_PRIMARY,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      );
}
