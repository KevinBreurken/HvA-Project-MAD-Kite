import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/widgets/modals/modal_cancel_data.dart';
import 'package:kiteup/widgets/modals/modal_template.dart';

class ModalCancel extends StatefulWidget {
  @override
  State createState() => _ModalCancelState();
}

class _ModalCancelState extends State<ModalCancel> {
  String reason = reasons[0];

  @override
  Widget build(BuildContext context) {
    ModalTemplate dialog = ModalTemplate(
      title: 'Why did you cancel?',
      function: () => Navigator.pop(context, reason),
    );
    dialog.child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 32,
          width: double.infinity,
          child: Text('Click on a reason to cancel',
              style: TextStyle(color: DARK_SECONDARY_TEXT, fontSize: 14)),
        ),
        SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: reasons
                  .map((e) => RadioListTile(
                        title:
                            Text(e, style: TextStyle(color: DARK_PRIMARY_TEXT)),
                        value: e,
                        activeColor: PRIMARY,
                        controlAffinity: ListTileControlAffinity.leading,
                        groupValue: reason,
                        selected: reason == e,
                        onChanged: (value) {
                          reason = value.toString();
                          setState(() {});
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
    return dialog;
  }
}
