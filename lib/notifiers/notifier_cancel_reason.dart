import 'package:flutter/cupertino.dart';
import 'package:kiteup/widgets/modals/modal_cancel_data.dart';

class CancelReasonNotifier extends ChangeNotifier {
  String _currentReason = reasons[0];
  CancelReasonNotifier();

  String get currentReason => _currentReason;

  updateReason(String value) {
    if (value != _currentReason) {
      _currentReason = value;
      notifyListeners();
    }
  }
}
