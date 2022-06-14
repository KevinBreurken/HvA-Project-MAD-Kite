import 'package:flutter/material.dart';
import 'package:kiteup/widgets/button_cancel.dart';
import 'package:kiteup/widgets/button_continue.dart';
import 'package:kiteup/widgets/button_stop.dart';

class StatusPageButtons extends StatelessWidget {
  const StatusPageButtons(this.continueButtonText, this.continueButtonFunction,
      this.stopButtonFunction);
  final String continueButtonText;
  final void Function() continueButtonFunction;
  final void Function() stopButtonFunction;

  Widget _buildChild() {
    if (continueButtonText.isEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonStop(stopButtonFunction),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 3),
        ButtonCancel(stopButtonFunction),
        const Spacer(flex: 1),
        ButtonContinue(continueButtonText, continueButtonFunction),
        const Spacer(flex: 3),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildChild();
}
