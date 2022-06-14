import 'package:flutter/cupertino.dart';

class FavoriteLocationNotifier extends ChangeNotifier {
  bool _currentState = false;
  FavoriteLocationNotifier();

  bool get currentScore => _currentState;

  updateScore(bool state) {
    if (state != _currentState) {
      _currentState = state;
      notifyListeners();
    }
  }
}
