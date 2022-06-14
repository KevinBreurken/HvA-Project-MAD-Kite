import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/notifiers/notifier_selected_location.dart';
import 'package:kiteup/widgets/modals/widgets/modal_buttons.dart';
import 'package:provider/provider.dart';

class ModalTemplate extends StatefulWidget {
  ModalTemplate(
      {Key? key, required this.title, this.child, required this.function})
      : super(key: key);
  final String title;
  late Widget? child;
  late void Function() function;

  @override
  State createState() => new _ModalTemplateState();
}

class _ModalTemplateState extends State<ModalTemplate> {
  @override
  Widget build(BuildContext context) {
    final _selectedLocationNotifier =
        Provider.of<SelectedLocationNotifier>(context);

    return AlertDialog(
      title: Text(
        widget.title,
        style: TextStyle(color: DARK_PRIMARY_TEXT, fontWeight: FontWeight.bold),
      ),
      backgroundColor: DARK_BACKGROUND_PRIMARY,
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          height: 32,
          width: double.infinity,
          child: Text(_selectedLocationNotifier.selectedLocation!.locationName,
              style: TextStyle(color: PRIMARY, fontSize: 12)),
        ),
        if (widget.child != null) widget.child!,
        SizedBox(
          height: 10,
        ),
        ModalButtons(widget.function),
      ]),
    );
  }
}
