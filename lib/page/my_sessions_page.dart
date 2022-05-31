import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                prefixIcon: const Icon(Icons.search,),
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
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sessions.length, 
              itemBuilder: (context, index) {
                final session = sessions[index];

                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                  decoration: BoxDecoration(
                    color: HexColor('484848'),
                    borderRadius: BorderRadius.circular(15)
                    ),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(session.locationName, style: TextStyle(color: HexColor("FFFFFF"))),
                        const Spacer(),
                        Text(session.date, style: TextStyle(color: HexColor("FFFFFF")))
                      ],
                      ),
                      Row(children: [
                        Text(session.gear, style: TextStyle(color: HexColor("848484")),),
                        const Spacer(),
                        Text(session.start + " - " + session.end, style: TextStyle(color: HexColor("848484")),)
                      ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                              RatingBarIndicator(
                                itemSize: 15,
                                direction: Axis.horizontal,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                                itemCount: 5,
                                rating: session.rating,
                                itemBuilder: (context, _) =>  Icon(
                                Icons.star,
                                color: HexColor("FAD309"),
                              ), )
                          ],
                        ),
                      )
                    ]
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
