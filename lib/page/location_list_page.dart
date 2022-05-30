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
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 4),
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
            Container(
              margin: const EdgeInsets.fromLTRB(4, 8, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text('Distance', style: TextStyle(color: DARK_PRIMARY_TEXT,fontSize: 11),),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text('Location', style: TextStyle(color: DARK_PRIMARY_TEXT,fontSize: 11),),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Wind',  style: TextStyle(color: DARK_PRIMARY_TEXT,fontSize: 11),),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Weather',  style: TextStyle(color: DARK_PRIMARY_TEXT,fontSize: 11),),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: sessions.length,
                  itemBuilder: (context, index) {
                    final location = sessions[index];

                    return GestureDetector(
                      onTap: () {
                        // LocationListPage.setLocationIndex(index);
                        // this.widget.callBackSetState(1);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    '14KM',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                width: 100,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Castricum aan zee',
                                    ),
                                    Text(
                                      'Stand, 19011 NZ Castricum',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                        child: Image.network(
                                          'https://picsum.photos/seed/27/600',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: AlignmentDirectional(0, -0.05),
                                        child: Text(
                                          '12km',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                        child: Image.network(
                                          'https://picsum.photos/seed/221/600',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          '5°C',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
