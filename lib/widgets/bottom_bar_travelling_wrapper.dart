import 'package:flutter/material.dart';
import 'package:kiteup/notifiers/notifier_planned_location.dart';
import 'package:kiteup/widgets/bottom_bar_travelling.dart';
import 'package:provider/provider.dart';

class BottomBarTravellingWrapper extends StatefulWidget {
  const BottomBarTravellingWrapper({Key? key}) : super(key: key);

  @override
  State createState() => _BottomBarTravellingWrapperState();
}

class _BottomBarTravellingWrapperState
    extends State<BottomBarTravellingWrapper> {
  _BottomBarTravellingWrapperState();

  @override
  Widget build(BuildContext context) {
    final _plannedLocationNotifier =
        Provider.of<PlannedLocationNotifier>(context);

    return ChangeNotifierProvider.value(
      value: _plannedLocationNotifier,
      child: const BottomBarTravelling(),
    );
  }
}
