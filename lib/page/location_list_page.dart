import 'package:flutter/material.dart';
import 'package:kiteup/dummy%20data/locations.dart';
import 'package:kiteup/widgets/item_location.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../helpers/hexcolor.dart';
import '../notifiers/notifier_selected_location.dart';

class LocationListPage extends StatefulWidget {
  const LocationListPage();

  @override
  _LocationListPage createState() => _LocationListPage();
}

class _LocationListPage extends State<LocationListPage> {
  //TODO: Implement logic to determine nearby locations.
  List<Location> nearbySpots = [allLocations[0], allLocations[1]];
  List<Location> listToSearch = [];
  List<Location> favoriteSpots = [];

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getFavorites();

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
          Visibility(
            //Hide the favorite list when it's empty.
            visible: favoriteSpots.isNotEmpty,
            child: Container(
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
