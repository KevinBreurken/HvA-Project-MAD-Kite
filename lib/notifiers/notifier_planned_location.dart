import 'package:flutter/cupertino.dart';
import 'package:kiteup/dummy%20data/locations.dart';

class PlannedLocationNotifier extends ChangeNotifier {
  Location? _plannedLocation;
  bool _isVisible = false;
  PlannedLocationNotifier();

  Location? get plannedLocation => _plannedLocation;
  bool get isVisible => _isVisible;

  updateLocation(Location value) {
    if (value != _plannedLocation) {
      _plannedLocation = value;
      notifyListeners();
    }
  }

  clearLocation() {
    _plannedLocation = null;
    notifyListeners();
  }

  updateVisibility(bool value) {
    if (value != _isVisible) {
      _isVisible = value;
      notifyListeners();
    }
  }
}
