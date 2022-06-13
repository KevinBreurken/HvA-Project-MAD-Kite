import 'package:flutter/cupertino.dart';

import '../dummy data/locations.dart';

class SelectedLocationNotifier extends ChangeNotifier {
  Location? _selectedLocation;
  SelectedLocationNotifier();

  Location get selectedLocation => _selectedLocation!;

  updateSelectedLocation(Location location){
    if (location != _selectedLocation) {
      _selectedLocation = location;
      notifyListeners();
    }
  }
}
