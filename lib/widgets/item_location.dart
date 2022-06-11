import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiteup/dummy%20data/locations.dart';
import 'dart:math' as math;

import '../constants.dart';
import '../helpers/hexcolor.dart';

class LocationItemWidget extends StatelessWidget {
  LocationItemWidget({Key? key, required Location location}) : this.location = location, super(key: key);

  Location location;

  @override
  Widget build(BuildContext context) {
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
            colors: [
              HexColor(location.windIconColor).withAlpha(100),
              Color(0xFF2F2F2F).withAlpha(10),
              Color(0xFF2F2F2F)
            ],
            stops: [0, 0.6, 1],
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
                    '${location.distance} KM',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
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
                        child: Text(location.locationName,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(location.adres,
                            style: Theme.of(context).textTheme.bodySmall),
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
                        child: Transform.rotate(
                          angle: -location.windDirection * (-math.pi / 180.0),
                          child: SvgPicture.asset(
                            'assets/location_item/wind_direction.svg',
                            height: 42,
                            width: 42,
                            fit: BoxFit.scaleDown,
                            color: HexColor(location.windIconColor),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text('${location.windSpeed}kn',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displaySmall),
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
                          height: 64,
                          width: 64,
                          color: DARK_PRIMARY_TEXT,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        '5°C',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall,
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
}
