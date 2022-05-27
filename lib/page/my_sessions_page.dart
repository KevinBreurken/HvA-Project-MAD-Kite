import 'package:flutter/material.dart';
import 'package:kiteup/dummy%20data/sessions.dart';
import 'package:kiteup/helpers/hexcolor.dart';
import 'package:kiteup/constants.dart';

class MySessionsPage extends StatefulWidget {
    @override
  _MySessionsPageState createState() => _MySessionsPageState();
}

class _MySessionsPageState extends State<MySessionsPage>
  with SingleTickerProviderStateMixin {
  List<Session> sessions = allSessions;
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
                final session = sessions[index];

                return Container(
                  margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    title: Text(session.locationName),
                    subtitle: Text(session.gear),
                    isThreeLine: true,
                    trailing: Text(session.date + "\n" + session.start + " - " + session.end, textAlign: TextAlign.right,),
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
    final suggestions = allSessions.where((session){
      final sessionLocation = session.locationName.toLowerCase();
      final input = query.toLowerCase();

      return sessionLocation.contains(input);
    }).toList();

    setState(() => sessions = suggestions);
  }
}
