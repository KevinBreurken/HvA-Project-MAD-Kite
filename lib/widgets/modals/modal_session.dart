import 'package:flutter/material.dart';
import 'package:kiteup/widgets/modals/modal_session_data.dart';
import 'package:kiteup/widgets/modals/modal_template.dart';
import 'package:kiteup/widgets/modals/widgets/modal_dropdown.dart';

class ModalSession extends StatefulWidget {
  @override
  State createState() => _ModalSessionState();
}

class _ModalSessionState extends State<ModalSession> {
  @override
  Widget build(BuildContext context) {
    String? kiteSize;
    String? kiteBoard;
    String? prepTime;

    ModalTemplate dialog = ModalTemplate(
        title: 'Session info',
        function: () => Navigator.pop(context, [
              int.parse(kiteSize!),
              int.parse(kiteBoard!),
              int.parse(prepTime!)
            ]));
    dialog.child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ModalDropdown(
            hint: 'Kite size...',
            items: boardSizes,
            onChange: (value) => kiteSize = value),
        ModalDropdown(
            hint: 'Kite board...',
            items: boardTypes,
            onChange: (value) => kiteBoard = value),
        ModalDropdown(
            hint: 'Preparation time...',
            items: preparationTimes,
            onChange: (value) =>
                prepTime = ((int.parse(value) + 1) * 900).toString())
      ],
    );
    return dialog;
  }
}
