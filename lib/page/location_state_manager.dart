import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/dummy%20data/locations.dart';
import 'package:kiteup/page/kiteup_status_page.dart';
import 'package:kiteup/page/location_info_place.dart';
import 'package:kiteup/page/location_list_page.dart';
import 'package:kiteup/widgets/bottom_bar_traveling.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationStateManager extends StatefulWidget {
  Function callbackSetState;
  Function callbackSetRoute;
  static final navigator = GlobalKey<NavigatorState>();

  LocationStateManager(this.callbackSetState, this.callbackSetRoute);

  @override
  _LocationStateManagerState createState() =>
      _LocationStateManagerState(callbackSetState, navigator, callbackSetRoute);
}

class _LocationStateManagerState extends State<LocationStateManager> {
  Function callbackSetState;
  Function callbackSetRoute;
  GlobalKey<NavigatorState> navigator;

  _LocationStateManagerState(
      this.callbackSetState, this.navigator, this.callbackSetRoute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Stack(children: <Widget>[
          Navigator(
            key: navigator,
            onGenerateRoute: (settings) {
              callbackSetRoute(settings.name);
              switch (settings.name) {
                case 'location_list':
                  return MaterialPageRoute(
                    builder: (context) => LocationListPage(),
                  );
                case 'location_details':
                  return MaterialPageRoute(
                    builder: (context) => KiteupLocationPage(),
                  );
                case 'kiteup_status_page':
                  return MaterialPageRoute(
                    builder: (context) => KiteupStatusPage(callbackSetState),
                  );
                default:
                  return MaterialPageRoute(
                    builder: (context) => LocationListPage(),
                  );
              }
            },
          ),
        ]));
  }
}
