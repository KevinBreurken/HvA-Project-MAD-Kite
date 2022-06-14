import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiteup/dummy%20data/locations.dart';
import 'dart:math' as math;

import '../constants.dart';
import '../helpers/hexcolor.dart';

class LocationItemWidget extends StatelessWidget {
  LocationItemWidget(
      {required Location location, required this.clickButtonFunction})
      : location = location;

  Location location;
  final void Function() clickButtonFunction;

  String getWeatherIconByWeatherType(WeatherType? weatherType) {
    const prefix = 'assets/location_item/';

    switch (weatherType) {
      case WeatherType.sunny:
        return prefix + 'weather_sunny.svg';
      case WeatherType.raining:
        return prefix + 'weather_rain.svg';
      case WeatherType.cloudy:
        return prefix + 'weather_cloudy.svg';
      case null:
        return "null";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickButtonFunction,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        decoration: BoxDecoration(
          color: DARK_BACKGROUND_PRIMARY,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x40000000),
              offset: Offset(0, 4),
            )
          ],
          gradient: LinearGradient(
            colors: [
              HexColor(location.windIconColor).withAlpha(100),
              const Color(0xFF2F2F2F).withAlpha(10),
              const Color(0xFF2F2F2F)
            ],
            stops: const [0, 0.6, 1],
            begin: const AlignmentDirectional(0, -1),
            end: const AlignmentDirectional(0, 1),
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
                decoration: const BoxDecoration(),
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
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
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Text(location.locationName,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
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
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
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
                      alignment: const AlignmentDirectional(0, 0),
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
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: SvgPicture.asset(
                          getWeatherIconByWeatherType(location.weatherType),
                          height: 32,
                          width: 32,
                          color: DARK_PRIMARY_TEXT,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
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
