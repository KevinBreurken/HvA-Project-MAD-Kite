import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiteup/dummy%20data/locations.dart';
import 'package:kiteup/widgets/item_location.dart';
import 'dart:math' as math;

import '../constants.dart';
import '../helpers/hexcolor.dart';
import '../notifiers/notifier_selected_location.dart';

class LocationListPage extends StatefulWidget {

  LocationListPage();

  @override
  _LocationListPage createState() => _LocationListPage();
}

class _LocationListPage extends State<LocationListPage> {
  List<Location> listToSearch = allLocations;
  List<Location> favoriteSpots = [allLocations[2]];
  //Dummycode to display some examples of spots nearby
  List<Location> nearbySpots = [allLocations[0],allLocations[1]];

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    //Start empty
    searchSession("");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: null,
      backgroundColor: DARK_BACKGROUND_PRIMARY,
      body: Column(children: <Widget>[
        //Favorite Spots
        Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                decoration: BoxDecoration(
                  color: HexColor('484848'),
                ),
                child: Row(
                  children: [
                    Text(
                      'Favorite Spots',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: favoriteSpots.length,
                  itemBuilder: (context, index) {
                    final location = favoriteSpots[index];

                    return LocationItemWidget(location: location);
                  }),
            ],
          ),
        ),
        //Nearby Spots
        Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                decoration: BoxDecoration(
                  color: HexColor('484848'),
                ),
                child: Row(
                  children: [
                    Text(
                      'Nearby Spots',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: nearbySpots.length,
                  itemBuilder: (context, index) {
                    final location = nearbySpots[index];

                    return LocationItemWidget(location: location);
                  }),
            ],
          ),
        ),
        //Search Spots
        Container(
          child: Expanded(child:Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                decoration: BoxDecoration(
                  color: HexColor('484848'),
                ),
                child: Row(
                  children: [
                    Text(
                      'Search spots',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: HexColor('484848'),
                ),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: HexColor('848484'),
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: PRIMARY),
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: searchSession,
                ),
              ),
              ListView.builder(

                  shrinkWrap: true,
                  itemCount: listToSearch.length,
                  itemBuilder: (context, index) {
                    final location = listToSearch[index];

                    return LocationItemWidget(location: location);
                  }),
            ],),
          ),
        ),

        ///Item labels
        // Container(
        //   margin: const EdgeInsets.fromLTRB(4, 8, 0, 0),
        //   child: Row(
        //     children: <Widget>[
        //       Expanded(
        //         flex: 1,
        //         child: Text(
        //           'Distance',
        //           textAlign: TextAlign.center,
        //           style: Theme.of(context).textTheme.labelSmall,
        //         ),
        //       ),
        //       Expanded(
        //           flex: 4,
        //           child: Padding(
        //             padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
        //             child: Text(
        //               'Location',
        //               style: Theme.of(context).textTheme.labelSmall,
        //             ),
        //           )),
        //       Expanded(
        //         flex: 1,
        //         child: Text(
        //           'Wind',
        //           textAlign: TextAlign.center,
        //           style: Theme.of(context).textTheme.labelSmall,
        //         ),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Text(
        //           'Weather',
        //           textAlign: TextAlign.center,
        //           style: Theme.of(context).textTheme.labelSmall,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ]));

  void searchSession(String query) {
    final suggestions = allLocations.where((session) {
      if (query.isEmpty) {
        return false;
      }

      final sessionLocation = session.locationName.toLowerCase();
      final input = query.toLowerCase();

      return sessionLocation.contains(input);
    }).toList();

    setState(() => listToSearch = suggestions);
  }
}
