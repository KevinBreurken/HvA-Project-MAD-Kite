import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/notifiers/notifier_kiteup_status.dart';
import 'package:kiteup/notifiers/notifier_selected_location.dart';
import 'package:kiteup/page/my_sessions_page.dart';
import 'package:kiteup/widgets/modals/modal_cancel.dart';
import 'package:kiteup/widgets/modals/modal_rating.dart';
import 'package:kiteup/widgets/modals/modal_session.dart';
import 'package:kiteup/widgets/modals/modal_session_data.dart';
import 'package:kiteup/widgets/status_page_buttons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class KiteupStatusPage extends StatefulWidget {
  Function callbackSetState;

  KiteupStatusPage(this.callbackSetState);

  @override
  _KiteupStatusPageState createState() => _KiteupStatusPageState(callbackSetState);
}

class _KiteupStatusPageState extends State<KiteupStatusPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Function callbackSetState;

  _KiteupStatusPageState(this.callbackSetState);

  late final SharedPreferences storage;

  String? status = '';
  String info = '';
  String timer = '';
  String svgFile = '';
  String buttonContinueText = '';

  late var cancelData;
  late var sessionData;
  late var ratingData;

  late DateTime endDateTime;

  void Function() buttonContinueFunction = () {};
  void Function() buttonStopFunction = () {};

  late StopWatchTimer stopWatchTimer;
  int? startTimerValue = 0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 3.0, end: 8.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    // Obtain shared preferences.
    loadStorage();

    super.initState();
  }

  loadStorage() async {
    storage = await SharedPreferences.getInstance();
    // storage.setString('kiteup-status', 'Traveling');
    status = storage.getString('kiteup-status');
    info = storage.getString('kiteup-board-data')!;

    if (status != null) {
      if (status == 'Gear-Up') {
        String? storageEndDateTime =
            storage.getString('kiteup-preparation-time');
        if (storageEndDateTime != null) {
          endDateTime = DateTime.parse(storageEndDateTime);
          stopWatchTimer = StopWatchTimer(
            presetMillisecond:
                endDateTime.difference(DateTime.now()).inMilliseconds,
            mode: StopWatchMode.countDown,
            onChangeRawSecond: (value) => setState(() {
              timer = formatHHMMSS(value);
            }),
            onEnded: () => {
              status = 'Kitesurfing',
              storage.setString('kiteup-status', status!)
            },
          );
          stopWatchTimer.onExecute.add(StopWatchExecute.start);
        } else {
          status = 'Traveling';
          storage.setString('kiteup-status', status!);
        }
      } else if (status == 'Kitesurfing') {
        startTimerValue = storage.getInt('kiteup-timer');
        stopWatchTimer = StopWatchTimer(
          presetMillisecond: startTimerValue! * 1000,
          mode: StopWatchMode.countUp,
          onChangeRawSecond: (value) => setState(() {
            timer = formatHHMMSS(value);
            storage.setInt('kiteup-timer', value);
          }),
        );
        stopWatchTimer.onExecute.add(StopWatchExecute.start);
      }
      loadPageStatusData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _selectedLocationNotifier =
        Provider.of<SelectedLocationNotifier>(context);

    loadPageStatusData();

    return Scaffold(
        appBar: null,
        body: Center(
            child: Scaffold(
                backgroundColor: DARK_BACKGROUND_PRIMARY,
                body: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        _selectedLocationNotifier.selectedLocation.locationName,
                        style: TextStyle(
                            color: DARK_PRIMARY_TEXT,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 100),
                      Container(
                          width: 237,
                          height: 237,
                          decoration: BoxDecoration(
                            color: DARK_BACKGROUND_PRIMARY,
                            borderRadius:
                                BorderRadius.all(Radius.circular(180)),
                            boxShadow: [
                              BoxShadow(
                                color: PRIMARY,
                                spreadRadius: _animation.value,
                                blurRadius: _animation.value,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  svgFile,
                                  height: 95,
                                  color: PRIMARY,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  status!,
                                  style: TextStyle(
                                      color: DARK_SECONDARY_TEXT, fontSize: 24),
                                ),
                                Text(
                                  info,
                                  style: TextStyle(
                                      color: DARK_THIRTH_TEXT, fontSize: 15),
                                )
                              ],
                            ),
                          )),
                      SizedBox(height: 20),
                      Text(
                        timer,
                        style:
                            TextStyle(color: DARK_PRIMARY_TEXT, fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      StatusPageButtons(buttonContinueText,
                          buttonContinueFunction, buttonStopFunction),
                      Spacer(
                        flex: 1,
                      ),
                    ])))));
  }

  void loadPageStatusData() {
    switch (status) {
      case 'Gear-Up':
        setState(() {
          svgFile = 'assets/status_gear.svg';
          info = info;
          buttonContinueText = 'Ready';
          buttonContinueFunction = () => {
                status = 'Kitesurfing',
                storage.setString('kiteup-status', status!),
                storage.remove('kiteup-preparation-time'),
                stopWatchTimer.onExecute.add(StopWatchExecute.stop),
                stopWatchTimer = StopWatchTimer(
                  mode: StopWatchMode.countUp,
                  onChangeRawSecond: (value) => setState(() {
                    timer = formatHHMMSS(value);
                    storage.setInt('kiteup-timer', value);
                  }),
                ),
                stopWatchTimer.onExecute.add(StopWatchExecute.start)
              };
          buttonStopFunction = () => {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ModalCancel();
                    })
              };
        });
        break;
      case 'Kitesurfing':
        setState(() {
          svgFile = 'assets/status_kitesurfing.svg';
          info = '';
          buttonContinueText = '';
          buttonContinueFunction = () => {};
          buttonStopFunction = () async => {
                stopWatchTimer.onExecute.add(StopWatchExecute.stop),
                ratingData = await showDialog(
                    context: context,
                    builder: (context) {
                      return ModalRating();
                    }),
                status = 'Traveling',
                storage.setString('kiteup-status', status!),
                callbackSetState(1),
                Navigator.pushNamed(context, '')
              };
        });
        break;
    }
  }

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
