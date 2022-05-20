import 'package:flutter/cupertino.dart';

class RatingScoreNotifier extends ChangeNotifier {
  double _currentScore = 1;
  RatingScoreNotifier();

  double get currentScore => _currentScore;

  updateScore(double value) {
    if (value != _currentScore) {
      _currentScore = value;
      notifyListeners();
    }
  }
}
