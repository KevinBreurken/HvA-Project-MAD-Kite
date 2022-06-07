import 'package:flutter/material.dart';

import 'package:kiteup/constants.dart';
import 'package:kiteup/notifiers/notifier_cancel_reason.dart';
import 'package:kiteup/notifiers/notifier_kiteup_status.dart';
import 'package:kiteup/notifiers/notifier_rating_score.dart';
import 'package:kiteup/notifiers/notifier_selected_location.dart';

import 'package:kiteup/page/location_list_page.dart';
import 'package:kiteup/page/kiteup_status_page.dart';
import 'package:kiteup/page/map_page.dart';
import 'package:kiteup/page/my_sessions_page.dart';
import 'package:kiteup/page/settings_page.dart';
import 'package:kiteup/theme/custom_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CancelReasonNotifier>(
      create: (_) => CancelReasonNotifier(),
    ),
    ChangeNotifierProvider<SelectedLocationNotifier>(
      create: (_) => SelectedLocationNotifier(),
    ),
    ChangeNotifierProvider<RatingScoreNotifier>(
      create: (_) => RatingScoreNotifier(),
    ),
    ChangeNotifierProvider<KiteupStatusNotifier>(
      create: (_) => KiteupStatusNotifier(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kite-Up',
      debugShowCheckedModeBanner: false,
      darkTheme: customDarkTheme(),
      theme: customLightTheme(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Kite-Up'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      LocationListPage(),
      MySessionsPage(),
      MapPage(),
      SettingsPage()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: TextStyle(
                color: PRIMARY,
                fontSize: 32,
                fontFamily: 'JotiOne',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: DARK_BACKGROUND_PRIMARY,
      ),
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: screens),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(canvasColor: DARK_BACKGROUND_PRIMARY),
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: NAVBAR_SELECTED,
          unselectedItemColor: NAVBAR_UNSELECTED,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
          ],
        ),
      ),
    );
  }
}
