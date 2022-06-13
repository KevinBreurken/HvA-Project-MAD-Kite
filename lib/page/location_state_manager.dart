import 'package:flutter/material.dart';
import 'package:kiteup/page/kiteup_status_page.dart';
import 'package:kiteup/page/location_info_place.dart';
import 'package:kiteup/page/location_list_page.dart';

class LocationStateManager extends StatefulWidget {
  Function callbackSetState;

  LocationStateManager(this.callbackSetState);

  @override
  _LocationStateManagerState createState() => _LocationStateManagerState(callbackSetState);
}

class _LocationStateManagerState extends State<LocationStateManager> {
  Function callbackSetState;
  int currentIndex = 0;

  _LocationStateManagerState(this.callbackSetState);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget page = LocationListPage();
          if (settings.name == 'location_details') page = KiteupLocationPage();
          if (settings.name == 'kiteup_status_page') page = KiteupStatusPage(callbackSetState);
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }
}