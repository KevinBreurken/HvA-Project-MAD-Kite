import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/dummy%20data/locations.dart';
import 'package:kiteup/helpers/hexcolor.dart';
import 'package:kiteup/notifiers/notifier_planned_location.dart';
import 'package:kiteup/notifiers/notifier_selected_location.dart';
import 'package:kiteup/page/location_state_manager.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class BottomBarTravelling extends StatefulWidget {
  const BottomBarTravelling({Key? key}) : super(key: key);

  @override
  State createState() => _BottomBarTravellingState();
}

class _BottomBarTravellingState extends State<BottomBarTravelling> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlannedLocationNotifier>(
        builder: (context, notifier, child) => (notifier.isVisible &&
                notifier.plannedLocation != null)
            ? GestureDetector(
                onTap: () {
                  notifier.updateLocation(notifier.plannedLocation!);
                  LocationStateManager.navigator.currentState
                      ?.pushNamed('location_details');
                  // Navigator.pushNamed(context, 'location_details');
                },
                child: Container(
                    color: DARK_BACKGROUND_PRIMARY,
                    child: Container(
                        height: 75,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: DARK_BACKGROUND_SECONDARY),
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/status_car.svg',
                                      height: 35,
                                      color: PRIMARY,
                                    ),
                                    Text(
                                      '15:00',
                                      style: TextStyle(
                                          color: DARK_PRIMARY_TEXT,
                                          fontSize: 16),
                                    ),
                                  ],
                                )),
                            const SizedBox(width: 10),
                            Expanded(
                                flex: 4,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        notifier.plannedLocation!.locationName,
                                        style: TextStyle(
                                            color: DARK_PRIMARY_TEXT,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        notifier.plannedLocation!.adres,
                                        style: TextStyle(
                                            color: DARK_SECONDARY_TEXT,
                                            fontSize: 14),
                                      ),
                                    ])),
                            const SizedBox(width: 10),
                            Expanded(
                                flex: 1,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Transform.rotate(
                                        angle: (-notifier.plannedLocation!
                                                .windDirection) *
                                            (-math.pi / 180.0),
                                        child: SvgPicture.asset(
                                          'assets/location_item/wind_direction.svg',
                                          height: 42,
                                          width: 42,
                                          fit: BoxFit.scaleDown,
                                          color: HexColor(notifier
                                              .plannedLocation!.windIconColor),
                                        ),
                                      ),
                                      Text(
                                        notifier.plannedLocation!.windSpeed
                                                .toString() +
                                            'kn',
                                        style: TextStyle(
                                            color: DARK_SECONDARY_TEXT,
                                            fontSize: 14),
                                      ),
                                    ])),
                            const SizedBox(width: 10),
                            Expanded(
                                flex: 1,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/location_item/weather_cloudy.svg',
                                        height: 42,
                                        width: 42,
                                        fit: BoxFit.scaleDown,
                                        color: DARK_PRIMARY_TEXT,
                                      ),
                                      Text(
                                        notifier.plannedLocation!.temperature
                                                .toString() +
                                            '°C',
                                        style: TextStyle(
                                            color: DARK_SECONDARY_TEXT,
                                            fontSize: 14),
                                      ),
                                    ]))
                          ],
                        ))))
            : SizedBox(height: 0));
  }
}
