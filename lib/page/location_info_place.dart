import 'package:flutter/material.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/notifiers/notifier_kiteup_status.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../notifiers/notifier_selected_location.dart';
import '../widgets/modals/modal_session.dart';
import '../widgets/modals/modal_session_data.dart';

class KiteupLocationPage extends StatefulWidget {

  KiteupLocationPage();
  
  @override
  _LocationInfoPageState createState() => _LocationInfoPageState();
}

class _LocationInfoPageState extends State<KiteupLocationPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  String goingText = " Going";

  _LocationInfoPageState();

  setGoingText(String text){
    setState(() {
      goingText = text;
    });
  }
  
  @override
	Widget build(BuildContext context) {
    
    final _selectedLocationNotifier =
        Provider.of<SelectedLocationNotifier>(context);
        
    final _kiteupStatusNotifier =
        Provider.of<KiteupStatusNotifier>(context);
    
    return Scaffold(
		appBar: null,
		body: Scaffold(
				backgroundColor: DARK_BACKGROUND_PRIMARY,
				body: Column(
					children: [
						Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
                if (goingText == " Going") BackButton(color: Colors.white, onPressed: () => {
                  Navigator.pop(context)})
                else Container(),
								Text(
									_selectedLocationNotifier.selectedLocation.locationName,
									style: TextStyle(
									color: DARK_PRIMARY_TEXT,
									fontSize: 30,
									fontWeight: FontWeight.bold)
								),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.favorite,
                    size: 30.0,
                    color: Colors.blueGrey,
                    semanticLabel: 'Click to add to favorites',
                  ),
                ),
							],
						),
						Image.asset('assets/graph.png'),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsetsDirectional.fromSTEB(15, 30, 0, 0),
                child: const Text(
                  "Activity",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )
                )
              )
            ),
            Expanded(
              child: SizedBox(
                height: 200,
                child: ListView(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 0),
                  children: <Widget>[
                    Container(
                      height: 25,
                      child: Center(child: Row(
                        children: const [
                          Text("10:22 ", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 20),
                          Text("Ryan Stanford will arrive at 14:00", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                    ),
                    Container(
                      height: 25,
                      child: Center(child: Row(
                        children: const [
                          Text("11:03 ", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 20),
                          Text("Cassidy Muels will arrive at 14:00", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                    ),
                    Container(
                      height: 25,
                      child: Center(child: Row(
                        children: const [
                          Text("12:17 ", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 20),
                          Text("Verny Seeker will arrive at 13:00", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                    ),
                    Container(
                      height: 25,
                      child: Center(child: Row(
                        children: const [
                          Text("12:52 ", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 20),
                          Text("Alsof Maker will arrive at 13:15", style: TextStyle(color: Colors.white)),
                        ],
                      )),
                    ),
                  ],
                )
              )
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              buttonHeight: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    _selectTime(context, _kiteupStatusNotifier);
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(color: Colors.green.shade600, spreadRadius: 3),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.car_crash, color: Colors.white),
                        Text('$goingText', style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    var sessionData = await showDialog(
                      context: context,
                      builder: (context) {
                        return ModalSession();
                    });
                    
                    if (sessionData[0] != null &&
                    sessionData[1] != null &&
                    sessionData[2] != null) {
                      var endDateTime = DateTime.now().add(Duration(seconds: sessionData[2]));
                      var storage = await SharedPreferences.getInstance();
                      await storage.setString('kiteup-status', 'Gear-Up');
                      await storage.setString('kiteup-preparation-time', endDateTime.toString());
                      await storage.setString('kiteup-board-data', boardSizes[sessionData[0]] + ', ' + boardTypes[sessionData[1]]);
                      Navigator.pushNamed(context, 'kiteup_status_page');
                    }
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(color: Colors.green.shade600, spreadRadius: 3),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.check, color: Colors.white),
                        const Text("Kite-up", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                )
              ],
            )
					]
				),
			)
		);
  }
  
  _selectTime(BuildContext context, _kiteupStatusNotifier) async {          
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial,
      );

      if(timeOfDay != null && timeOfDay != selectedTime)
        {
          setGoingText(" " + timeOfDay.format(context));
          _kiteupStatusNotifier.updateStatus("Traveling");
        } else {
          setGoingText(" Going");
          _kiteupStatusNotifier.updateStatus("");
        }
  }
}
