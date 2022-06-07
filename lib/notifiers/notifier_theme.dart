import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiteup/theme/custom_theme.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}