import 'package:kiteup/helpers/hexcolor.dart';

enum WeatherType { sunny, raining }

class Location {
  final String locationName;
  final String adres;
  final num distance;
  final num windSpeed;
  final num windDirection;
  final String windIconColor;
  final num temperature;
  final WeatherType weatherType;

  const Location(
      {required this.locationName,
      required this.adres,
      required this.distance,
      required this.windSpeed,
      required this.windDirection,
      required this.temperature,
      required this.weatherType,
      required this.windIconColor});
}

const allLocations = [
  Location(
      locationName: 'Castricum aan Zee',
      adres: 'Strand, 1901 NZ Castricum',
      distance: 4,
      windSpeed: 12,
      windDirection: 90,
      temperature: 5,
      weatherType: WeatherType.raining,
      windIconColor: "76E648"),
  Location(
      locationName: 'Bloemendaal aan Zee',
      adres: 'Strand, 151 TS Bloemendaal',
      distance: 14,
      windSpeed: 8,
      windDirection: 45,
      temperature: 7,
      weatherType: WeatherType.raining,
      windIconColor: "F09D0A"),
  Location(
      locationName: 'Strand Wijk aan Zee',
      adres: 'Strand, 1901 NZ Bloemendaal',
      distance: 7,
      windSpeed: 1,
      windDirection: 185,
      temperature: 32,
      weatherType: WeatherType.raining,
      windIconColor: "DEDEDE"),
  Location(
      locationName: 'Egmond aan Zee',
      adres: 'Strand, 1486 AZ Egmond',
      distance: 14,
      windSpeed: 4,
      windDirection: 310,
      temperature: 1,
      weatherType: WeatherType.raining,
      windIconColor: "3971FF"),
  Location(
      locationName: 'Castricum aan Zee',
      adres: 'Strand, 1901 NZ Castricum',
      distance: 4,
      windSpeed: 12,
      windDirection: 90,
      temperature: 5,
      weatherType: WeatherType.raining,
      windIconColor: "76E648"),
  Location(
      locationName: 'Bloemendaal aan Zee',
      adres: 'Strand, 151 TS Bloemendaal',
      distance: 14,
      windSpeed: 8,
      windDirection: 45,
      temperature: 7,
      weatherType: WeatherType.raining,
      windIconColor: "F09D0A"),
  Location(
      locationName: 'Strand Wijk aan Zee',
      adres: 'Strand, 1901 NZ Bloemendaal',
      distance: 7,
      windSpeed: 1,
      windDirection: 185,
      temperature: 32,
      weatherType: WeatherType.raining,
      windIconColor: "DEDEDE"),
  Location(
      locationName: 'Egmond aan Zee',
      adres: 'Strand, 1486 AZ Egmond',
      distance: 14,
      windSpeed: 4,
      windDirection: 310,
      temperature: 1,
      weatherType: WeatherType.raining,
      windIconColor: "3971FF"),
  Location(
      locationName: 'Castricum aan Zee',
      adres: 'Strand, 1901 NZ Castricum',
      distance: 4,
      windSpeed: 12,
      windDirection: 90,
      temperature: 5,
      weatherType: WeatherType.raining,
      windIconColor: "76E648"),
  Location(
      locationName: 'Bloemendaal aan Zee',
      adres: 'Strand, 151 TS Bloemendaal',
      distance: 14,
      windSpeed: 8,
      windDirection: 45,
      temperature: 7,
      weatherType: WeatherType.raining,
      windIconColor: "F09D0A"),
  Location(
      locationName: 'Strand Wijk aan Zee',
      adres: 'Strand, 1901 NZ Bloemendaal',
      distance: 7,
      windSpeed: 1,
      windDirection: 185,
      temperature: 32,
      weatherType: WeatherType.raining,
      windIconColor: "DEDEDE"),
  Location(
      locationName: 'Egmond aan Zee',
      adres: 'Strand, 1486 AZ Egmond',
      distance: 14,
      windSpeed: 4,
      windDirection: 310,
      temperature: 1,
      weatherType: WeatherType.raining,
      windIconColor: "3971FF"),
  Location(
      locationName: 'Castricum aan Zee',
      adres: 'Strand, 1901 NZ Castricum',
      distance: 4,
      windSpeed: 12,
      windDirection: 90,
      temperature: 5,
      weatherType: WeatherType.raining,
      windIconColor: "76E648"),
  Location(
      locationName: 'Bloemendaal aan Zee',
      adres: 'Strand, 151 TS Bloemendaal',
      distance: 14,
      windSpeed: 8,
      windDirection: 45,
      temperature: 7,
      weatherType: WeatherType.raining,
      windIconColor: "F09D0A"),
  Location(
      locationName: 'Strand Wijk aan Zee',
      adres: 'Strand, 1901 NZ Bloemendaal',
      distance: 7,
      windSpeed: 1,
      windDirection: 185,
      temperature: 32,
      weatherType: WeatherType.raining,
      windIconColor: "DEDEDE"),
  Location(
      locationName: 'Egmond aan Zee',
      adres: 'Strand, 1486 AZ Egmond',
      distance: 14,
      windSpeed: 4,
      windDirection: 310,
      temperature: 1,
      weatherType: WeatherType.raining,
      windIconColor: "3971FF"),
];

const likedLocations = [
  Location(
      locationName: 'Castricum aan Zee',
      adres: 'Strand, 1901 NZ Castricum',
      distance: 4,
      windSpeed: 12,
      windDirection: 90,
      temperature: 5,
      weatherType: WeatherType.raining,
      windIconColor: "76E648"),
];
