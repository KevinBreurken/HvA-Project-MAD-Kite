import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/dummy%20data/sessions.dart';
import 'package:kiteup/notifiers/notifier_selected_location.dart';
import 'package:kiteup/widgets/modals/modal_template.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class ModalRating extends StatefulWidget {
  @override
  State createState() => _ModalRatingState();
}

class _ModalRatingState extends State<ModalRating> {
  late SharedPreferences storage;
  late String locationName;
  late String gear;
  late DateTime start;
  late DateTime end;
  late Session session;

  @override
  Widget build(BuildContext context) {
    double rating = 3.0;

    final _selectedLocationNotifier =
        Provider.of<SelectedLocationNotifier>(context);

    late final SharedPreferences storage;
    late final Session session;
    late final String locationName;
    late final String gear;
    late final DateTime start;
    late final DateTime end;

    ModalTemplate dialog = ModalTemplate(
      title: 'Rate this session',
      function: () async => {
        storage = await SharedPreferences.getInstance(),
        locationName = _selectedLocationNotifier.selectedLocation!.locationName,
        gear = storage.getString('kiteup-board-data')!,
        end = DateTime.now(),
        start = end
            .subtract(Duration(seconds: storage.getInt('kiteup-timer')!)),
        session = Session(
            locationName: locationName,
            gear: gear,
            rating: rating,
            start: DateFormat('HH:mm').format(start),
            end: DateFormat('HH:mm').format(end),
            date: DateFormat('yyyy-MM-dd').format(start)),
        allSessions.add(session),
        Navigator.pop(context, [rating])
      },
    );
    dialog.child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 32,
          width: double.infinity,
          child: Text('How was this kite session',
              style: TextStyle(color: DARK_SECONDARY_TEXT, fontSize: 14)),
        ),
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: RATING,
          ),
          onRatingUpdate: (value) {
            if (rating != value) {
              rating = value;
            }
          },
        )
      ],
    );
    return dialog;
  }
}
