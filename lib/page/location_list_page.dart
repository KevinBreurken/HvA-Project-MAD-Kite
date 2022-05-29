import 'package:flutter/material.dart';
import 'package:kiteup/dummy%20data/locations.dart';

import '../constants.dart';
import '../helpers/hexcolor.dart';

class LocationListPage extends StatefulWidget {
  @override
  _LocationListPage createState() => _LocationListPage();
}

class _LocationListPage extends State<LocationListPage> {

  List<Location> sessions = allLocations;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: null,
      backgroundColor: DARK_BACKGROUND_PRIMARY,
      body: Column(
          children: <Widget> [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
                onChanged: searchSession,
              ),

            ),
            Expanded(
              child: ListView.builder(
                  itemCount: sessions.length,
                  itemBuilder: (context, index) {
                    final location = sessions[index];

                    return Container(
                      margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        title: Text(location.locationName),
                        subtitle: Text(location.adres),
                        isThreeLine: true,
                        tileColor: HexColor('848484'),
                      ),
                    );
                  }
              ),
            )
          ]

      )

  );


  void searchSession(String query) {
    final suggestions = allLocations.where((session){
      final sessionLocation = session.locationName.toLowerCase();
      final input = query.toLowerCase();

      return sessionLocation.contains(input);
    }).toList();

    setState(() => sessions = suggestions);
  }
}
