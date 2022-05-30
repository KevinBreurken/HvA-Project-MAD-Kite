import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiteup/dummy%20data/locations.dart';
import 'dart:math' as math;

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
                    child: Text('Distance',textAlign: TextAlign.center, style: TextStyle(color: DARK_SECONDARY_TEXT,fontSize: 11),),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text('Location', style: TextStyle(color: DARK_SECONDARY_TEXT,fontSize: 11),),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Wind',textAlign: TextAlign.center,  style: TextStyle(color: DARK_SECONDARY_TEXT,fontSize: 11),),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Weather',textAlign: TextAlign.center,  style: TextStyle(color: DARK_SECONDARY_TEXT,fontSize: 11),),
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
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x40000000),
                              offset: Offset(0, 4),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [Color(0xFF224324), Color(0xFF2F2F2F), Color(0xFF2F2F2F)],
                            stops: [0, 0.5, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    '14 KM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                        color: DARK_PRIMARY_TEXT,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text(
                                          'Castricum aan zee',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: DARK_PRIMARY_TEXT,
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text(
                                          'Stand, 19011 NZ Castricum',
                                          style: TextStyle(
                                            color: Color(0xFF848484),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                        child: Transform.rotate(angle: -90 * (-math.pi / 180.0),child: SvgPicture.asset(
                                          'assets/location_item/wind_direction.svg',
                                          height: 95,
                                          color: DARK_PRIMARY_TEXT,
                                        ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '12km',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: DARK_PRIMARY_TEXT,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
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
                                height: 100,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                        child: SvgPicture.asset(
                                          'assets/location_item/weather_cloudy.svg',
                                          height: 95,
                                          color: DARK_PRIMARY_TEXT,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        '5°C',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: DARK_PRIMARY_TEXT,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
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
