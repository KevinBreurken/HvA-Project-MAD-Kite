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
      body: Column(children: <Widget>[
        Container(
          child: Expanded(child:Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                decoration: BoxDecoration(
                  color: DARK_BACKGROUND_SECONDARY,
                ),
                child: Row(
                  children: [
                    Text(
                      'Filter sessions',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: HexColor('484848'),
                ),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: LIGHT_THIRTH_TEXT,
                      prefixIcon: const Icon(Icons.search),
                      focusColor: LIGHT_THIRTH_TEXT,
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: PRIMARY),
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: searchSession,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      final session = sessions[index];

                      return Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                        decoration: BoxDecoration(
                            color: HexColor('484848'),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(session.locationName,
                                      style: Theme.of(context).textTheme.titleLarge),
                                  const Spacer(),
                                  Text(session.date,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: DARK_THIRTH_TEXT))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    session.gear,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: DARK_THIRTH_TEXT),
                                  ),
                                  const Spacer(),
                                  Text(
                                    session.start + " - " + session.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: DARK_THIRTH_TEXT),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: [
                                    RatingBarIndicator(
                                      itemSize: 24,
                                      direction: Axis.horizontal,
                                      itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                      itemCount: 5,
                                      rating: session.rating,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: HexColor("FAD309"),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      );
                    }),
              )
            ],),
          ),
        ),
        // Container(
        //   decoration: BoxDecoration(
        //     color: HexColor('484848'),
        //   ),
        //   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        //   child: TextField(
        //     controller: controller,
        //     decoration: InputDecoration(
        //         filled: true,
        //         fillColor: LIGHT_THIRTH_TEXT,
        //         prefixIcon: const Icon(Icons.search),
        //         focusColor: LIGHT_THIRTH_TEXT,
        //         hintText: 'Search...',
        //         border: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(30),
        //         ),
        //         focusedBorder: OutlineInputBorder(
        //             borderSide: BorderSide(color: PRIMARY),
        //             borderRadius: BorderRadius.circular(30))),
        //     onChanged: searchSession,
        //   ),
        // ),
      ]));

  void searchSession(String query) {
    final suggestions = allSessions.where((session) {
      final sessionLocation = session.locationName.toLowerCase();
      final input = query.toLowerCase();

      return sessionLocation.contains(input);
    }).toList();

    setState(() => sessions = suggestions);
  }
}
