import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kiteup/constants.dart';
import 'package:kiteup/notifiers/notifier_rating_score.dart';
import 'package:kiteup/widgets/modals/modal_template.dart';
import 'package:provider/provider.dart';

class ModalRating extends StatefulWidget {
  @override
  State createState() => new _ModalRatingState();
}

class _ModalRatingState extends State<ModalRating> {
  @override
  Widget build(BuildContext context) {
    double? rating;

    ModalTemplate dialog = ModalTemplate(
      title: 'Rate this session',
      function: () => Navigator.pop(context, [rating]),
    );
    dialog.child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 32,
          width: double.infinity,
          child: Text('How was this kite session',
              style: TextStyle(color: DARK_SECONDARY_TEXT, fontSize: 14)),
        ),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
