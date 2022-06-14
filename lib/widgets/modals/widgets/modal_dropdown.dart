import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';

class ModalDropdown extends StatefulWidget {
  const ModalDropdown(
      {Key? key,
      required this.onChange,
      required this.hint,
      required this.items})
      : super(key: key);

  final String hint;
  final List<String> items;
  final SelectionCallback onChange;

  @override
  State<ModalDropdown> createState() => _ModalDropdownState();
}

class _ModalDropdownState extends State<ModalDropdown> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36,
        width: double.infinity,
        decoration: BoxDecoration(
          color: DARK_BACKGROUND_SECONDARY,
          borderRadius: BorderRadius.circular(180),
        ),
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        padding: const EdgeInsets.all(10),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          isExpanded: true,
          iconEnabledColor: DARK_SECONDARY_TEXT,
          iconSize: 14,
          hint: Text(
            widget.hint,
            style: TextStyle(color: DARK_SECONDARY_TEXT, fontSize: 14),
          ),
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: widget.items.indexOf(value).toString(),
              child: Text(value),
            );
          }).toList(),
          dropdownColor: DARK_BACKGROUND_SECONDARY,
          onChanged: (String? newValue) {
            setState(() {
              selected = newValue!;
            });
            widget.onChange(newValue!);
          },
          value: selected,
          style: TextStyle(color: DARK_PRIMARY_TEXT),
        )));
  }
}

typedef SelectionCallback = void Function(String value);
