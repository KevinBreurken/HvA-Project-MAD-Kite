import 'package:flutter/material.dart';

import '../constants.dart';

ThemeData customLightTheme() {

  TextTheme _customLightThemesTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1?.copyWith(
        fontFamily: 'Roboto',
        fontSize: 22.0,
        color: Colors.green,
      ),
      headline6: base.headline6?.copyWith(
          fontSize: 15.0,
          color: Colors.orange
      ),
      headline4: base.headline1?.copyWith(
        fontSize: 24.0,
        color: Colors.white,
      ),
      headline3: base.headline1?.copyWith(
        fontSize: 22.0,
        color: Colors.grey,
      ),
      caption: base.caption?.copyWith(
        color: Color(0xFFCCC5AF),
      ),
      bodyText2: base.bodyText2?.copyWith(color: Color(0xFF807A6B)),
      bodyText1: base.bodyText1?.copyWith(color: Colors.brown),
    );
  }

  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
    primaryColor: Color(0xffce107c),
    indicatorColor: Color(0xFF807A6B),
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    accentColor: Color(0xFFFFF8E1),
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: Colors.white,
      size: 20,
    ),
    iconTheme: lightTheme.iconTheme.copyWith(
      color: Colors.white,
    ),
    buttonColor: Colors.white,
    backgroundColor: Colors.white,
    tabBarTheme: lightTheme.tabBarTheme.copyWith(
      labelColor: Color(0xffce107c),
      unselectedLabelColor: Colors.grey,
    ),
    buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: Colors.red),
    cursorColor: Colors.deepPurple,
    errorColor: Colors.red,
  );
}


ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    primaryColor: Colors.black38,
    indicatorColor: Color(0xFF807A6B),
    textTheme: darkTheme.textTheme.copyWith(
      labelSmall: TextStyle(color: DARK_SECONDARY_TEXT,fontSize: 11,fontFamily: 'Roboto',letterSpacing: 0.2),
        headlineSmall: TextStyle(color: DARK_PRIMARY_TEXT,fontSize: 20,fontFamily: 'Roboto'),
      bodySmall: TextStyle(color: Color(0xFF848484),fontSize: 14,fontFamily: 'Roboto'),


    ),
    accentColor: Color(0xFFFFF8E1),
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: Colors.green,
      size: 20,
    ),
    cursorColor: Colors.green,
  );
}