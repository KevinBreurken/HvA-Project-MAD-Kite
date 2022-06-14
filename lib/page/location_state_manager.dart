import 'package:flutter/material.dart';
import 'package:kiteup/page/kiteup_status_page.dart';
import 'package:kiteup/page/location_info_place.dart';
import 'package:kiteup/page/location_list_page.dart';

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
  String initialRoute = 'location_list';

  _LocationStateManagerState(
      this.callbackSetState, this.navigator, this.callbackSetRoute);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Stack(children: <Widget>[
          Navigator(
            initialRoute: initialRoute,
            key: navigator,
            onGenerateRoute: (settings) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => callbackSetRoute(settings.name));
              switch (settings.name) {
                case 'location_list':
                  return MaterialPageRoute(
                    builder: (context) => const LocationListPage(),
                  );
                case 'location_details':
                  return MaterialPageRoute(
                    builder: (context) => const KiteupLocationPage(),
                  );
                case 'kiteup_status_page':
                  return MaterialPageRoute(
                    builder: (context) => KiteupStatusPage(callbackSetState),
                  );
                default:
                  return MaterialPageRoute(
                    builder: (context) => const LocationListPage(),
                  );
              }
            },
          ),
        ]));
  }
}
