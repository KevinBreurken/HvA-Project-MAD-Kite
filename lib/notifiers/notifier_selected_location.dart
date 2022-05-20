import 'package:flutter/cupertino.dart';

class SelectedLocationNotifier extends ChangeNotifier {
  String _currentLocation = 'Castricum aan zee';
  SelectedLocationNotifier();

  String get currentLocation => _currentLocation;

  updateLocation(String value) {
    if (value != _currentLocation) {
      _currentLocation = value;
      notifyListeners();
    }
  }
}
