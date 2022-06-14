import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kiteup/constants.dart';
import 'package:kiteup/dummy%20data/locations.dart';
import 'package:kiteup/notifiers/notifier_cancel_reason.dart';
import 'package:kiteup/notifiers/notifier_favorite_location.dart';
import 'package:kiteup/notifiers/notifier_kiteup_status.dart';
import 'package:kiteup/notifiers/notifier_planned_location.dart';
import 'package:kiteup/notifiers/notifier_rating_score.dart';
import 'package:kiteup/notifiers/notifier_selected_location.dart';

import 'package:kiteup/page/location_state_manager.dart';
import 'package:kiteup/page/map_page.dart';
import 'package:kiteup/page/my_sessions_page.dart';
import 'package:kiteup/page/settings_page.dart';
import 'package:kiteup/widgets/bottom_bar_travelling_wrapper.dart';
import 'package:kiteup/theme/custom_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notifiers/notifier_theme.dart';

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
    ChangeNotifierProvider<PlannedLocationNotifier>(
      create: (_) => PlannedLocationNotifier(),
    ),
    ChangeNotifierProvider<FavoriteLocationNotifier>(
      create: (_) => FavoriteLocationNotifier(),
    ),
    ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(customDarkTheme()),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Kite-Up',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
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

String activeRoute = '/location_list';

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      LocationStateManager(callbackSetState, callbackSetRoute),
      MySessionsPage(),
      MapPage(),
      SettingsPage()
    ];

    final _selectedLocationNotifier =
        Provider.of<SelectedLocationNotifier>(context);
    final _plannedLocationNotifier =
        Provider.of<PlannedLocationNotifier>(context);

    WidgetsBinding.instance!.addPostFrameCallback((_) => getPlannedLocation(
        _plannedLocationNotifier, _selectedLocationNotifier));

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
          data:
              Theme.of(context).copyWith(canvasColor: DARK_BACKGROUND_PRIMARY),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomBarTravellingWrapper(),
              BottomNavigationBar(
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
              )
            ],
          ),
        ));
  }

  getPlannedLocation(PlannedLocationNotifier plannedLocationNotifier,
      SelectedLocationNotifier selectedLocationNotifier) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String? locationJson = storage.getString('planned-location');

    if (locationJson != null) {
      Map<String, dynamic> locationMapping = await jsonDecode(locationJson);
      Location parsedLocation = Location.fromJson(locationMapping);

      if (plannedLocationNotifier.plannedLocation != null) {
        if (plannedLocationNotifier.plannedLocation!.id != parsedLocation.id) {
          plannedLocationNotifier.updateLocation(parsedLocation);
          storage.setString('planned-location', jsonEncode(parsedLocation));
        }
      } else {
        plannedLocationNotifier.updateLocation(parsedLocation);
        storage.setString('planned-location', jsonEncode(parsedLocation));
      }

      if (activeRoute == 'kiteup_status_page') {
        if (plannedLocationNotifier.isVisible) {
          plannedLocationNotifier.updateVisibility(false);
        }
      } else if (activeRoute == 'location_details') {
        if (plannedLocationNotifier.plannedLocation!.locationName ==
            selectedLocationNotifier.selectedLocation!.locationName) {
          if (plannedLocationNotifier.isVisible) {
            plannedLocationNotifier.updateVisibility(false);
          }
        } else {
          if (!plannedLocationNotifier.isVisible) {
            plannedLocationNotifier.updateVisibility(true);
          }
        }
      } else {
        if (!plannedLocationNotifier.isVisible) {
          plannedLocationNotifier.updateVisibility(true);
        }
      }
    } else {
      if (plannedLocationNotifier.isVisible) {
        plannedLocationNotifier.updateVisibility(false);
      }
    }
  }

  void callbackSetState(newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  void callbackSetRoute(String route) {
    setState(() {
      activeRoute = route;
    });
  }
}
