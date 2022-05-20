import 'package:flutter/cupertino.dart';

class KiteupStatusNotifier extends ChangeNotifier {
  String _currentStatus = 'Traveling';
  KiteupStatusNotifier();

  String get currentStatus => _currentStatus;

  updateStatus(String value) {
    if (value != _currentStatus) {
      _currentStatus = value;
      notifyListeners();
    }
  }
}
