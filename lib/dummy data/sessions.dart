class Session {
  final String locationName;
  final String gear;
  final double rating;
  final String date;
  final String start;
  final String end;

  const Session(
      {required this.locationName,
      required this.gear,
      required this.rating,
      required this.start,
      required this.end,
      required this.date});
}

var allSessions = [
  Session(
      locationName: 'Castricum aan zee',
      gear: '9m2, twin-tip',
      rating: 4,
      start: '14:00',
      end: '15:33',
      date: '2022-3-12'),
  Session(
      locationName: 'Zeeland',
      gear: '9m2, twin-tip',
      rating: 5,
      start: '14:00',
      end: '15:33',
      date: '2022-5-30'),
  Session(
      locationName: 'Limburg',
      gear: '9m2, twin-tip',
      rating: 1,
      start: '14:00',
      end: '15:33',
      date: '2021-5-21'),
];
