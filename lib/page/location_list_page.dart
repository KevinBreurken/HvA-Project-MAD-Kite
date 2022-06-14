import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiteup/dummy%20data/locations.dart';
import 'package:kiteup/notifiers/notifier_favorite_location.dart';
import 'package:kiteup/widgets/item_location.dart';
import 'package:provider/provider.dart';
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
  List<Location> favoriteSpots = [];

  //Dummycode to display some examples of spots nearby
  List<Location> nearbySpots = [allLocations[0], allLocations[1]];

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Called");
    //Start empty
    getFavorites();
    searchSession("");
  }

  @override
  Widget build(BuildContext context) {
    getFavorites();
    print(favoriteSpots.length);
    final _favoriteLocationNotifier =
    Provider.of<FavoriteLocationNotifier>(context);

    final _selectedLocationNotifier =
        Provider.of<SelectedLocationNotifier>(context);

    void onLocationCLick(Location location) {
      _selectedLocationNotifier.updateSelectedLocation(location);
      Navigator.pushNamed(context, 'location_details');
    }

    return Scaffold(
        appBar: null,
        body: Column(children: <Widget>[
          //Favorite Spots
          Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: BoxDecoration(
                    color: DARK_BACKGROUND_SECONDARY,
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

                      return LocationItemWidget(
                          location: location,
                          clickButtonFunction: () {
                            onLocationCLick(location);
                          });
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
                    color: DARK_BACKGROUND_SECONDARY,
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
                      return LocationItemWidget(
                          location: location,
                          clickButtonFunction: () {
                            onLocationCLick(location);
                          });
                    }),
              ],
            ),
          ),
          //Search Spots
          Container(
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    decoration: BoxDecoration(
                      color: DARK_BACKGROUND_SECONDARY,
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
                          fillColor: LIGHT_THIRTH_TEXT,
                          prefixIcon: const Icon(Icons.search),
                          focusColor: LIGHT_THIRTH_TEXT,
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
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listToSearch.length,
                        itemBuilder: (context, index) {
                          final location = listToSearch[index];
                          return LocationItemWidget(
                              location: location,
                              clickButtonFunction: () {
                                onLocationCLick(location);
                              });
                        }),
                  ),
                ],
              ),
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
  }

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

  void getFavorites() {
    final suggestions = allLocations.where((location) {
      return location.isLiked;
    }).toList();
    setState(() => favoriteSpots = suggestions);
  }
}
