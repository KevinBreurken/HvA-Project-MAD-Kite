import 'package:flutter/material.dart';

import '../constants.dart';

ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    scaffoldBackgroundColor: DARK_BACKGROUND_PRIMARY,
    textTheme: darkTheme.textTheme.copyWith(
        headlineLarge: TextStyle(
            color: DARK_SECONDARY_TEXT,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            letterSpacing: 0.2),
        titleLarge: TextStyle(
            color: DARK_SECONDARY_TEXT,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            letterSpacing: 0.2),
        labelSmall: TextStyle(
            color: DARK_SECONDARY_TEXT,
            fontSize: 11,
            fontFamily: 'Roboto',
            letterSpacing: 0.2),
        headlineSmall: TextStyle(
            color: DARK_PRIMARY_TEXT,fontSize: 20, fontFamily: 'Roboto'),
        bodySmall: TextStyle(
            color: DARK_BODY_SMALL, fontSize: 14, fontFamily: 'Roboto'),
        bodyMedium: TextStyle(
            color: DARK_PRIMARY_TEXT, fontSize: 14, fontFamily: 'Roboto'),
        displaySmall: TextStyle(color: DARK_PRIMARY_TEXT, fontSize: 16),
        displayMedium: TextStyle(
          color: DARK_PRIMARY_TEXT,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        )),
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: Colors.green,
      size: 20,
    ),
  );
}
