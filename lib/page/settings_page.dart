import 'package:flutter/material.dart';
import 'package:kiteup/notifiers/notifier_theme.dart';
import 'package:kiteup/theme/custom_theme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
        appBar: null,
        body: Center(
          child: Column(children: <Widget>[
            ElevatedButton(
                onPressed: () => {themeNotifier.setTheme(customLightTheme())},
                child: new Text('Light theme'))
          ,ElevatedButton(
                onPressed: () => {themeNotifier.setTheme(customDarkTheme())},
                child: new Text('Dark theme'))
          ]),
        ));
  }
}
