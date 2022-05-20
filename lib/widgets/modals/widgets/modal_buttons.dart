import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/widgets/BUTTON_CANCEL.dart';
import 'package:kiteup/widgets/button_continue.dart';
import 'package:kiteup/widgets/button_stop.dart';
import 'package:kiteup/widgets/modals/widgets/modal_BUTTON_CANCEL.dart';
import 'package:kiteup/widgets/modals/widgets/modal_button_confirm.dart';

class ModalButtons extends StatelessWidget {
  ModalButtons(this.function);
  final void Function() function;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ModalButtonCancel(),
          SizedBox(
            width: 10,
          ),
          ModalButtonConfirm(function),
        ],
      );
}
