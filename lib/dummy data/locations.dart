import 'package:kiteup/helpers/hexcolor.dart';

enum WeatherType { sunny, raining, cloudy }

class Location{
  final int? id;
  final String locationName;
  final String adres;
  final num distance;
  final num windSpeed;
  final num windDirection;
  final String windIconColor;
  final num temperature;
  final WeatherType weatherType;

  const Location({
    this.id,
    required this.locationName,
    required this.adres,
    required this.distance,
    required this.windSpeed,
    required this.windDirection,
    required this.temperature,
    required this.weatherType,
    required this.windIconColor
  });

  @override
  String toString() {
    return 'Location{id: $id, locationName: $locationName, adres: $adres, distance: $distance, windSpeed: $windSpeed, windDirection: $windDirection, temperature: $temperature, weatherType: $weatherType, windIconColor: $windIconColor}';
  }
}

const List<Location> allLocations = [
  Location(id: 1, locationName: 'Castricum aan Zee', adres: 'Strand, 1901 NZ Castricum', distance: 4, windSpeed: 12,windDirection: 90,temperature: 5,weatherType: WeatherType.raining,windIconColor: "76E648"),
  Location(id: 2, locationName: 'Bloemendaal aan Zee', adres: 'Strand, 151 TS Bloemendaal', distance: 14, windSpeed: 8,windDirection: 45,temperature: 7,weatherType: WeatherType.raining,windIconColor: "F09D0A"),
  Location(id: 3, locationName: 'Strand Wijk aan Zee', adres: 'Strand, 1901 NZ Bloemendaal', distance: 7, windSpeed: 1,windDirection: 185,temperature: 32,weatherType: WeatherType.raining,windIconColor: "DEDEDE"),
  Location(id: 4, locationName: 'Egmond aan Zee', adres: 'Strand, 1486 AZ Egmond', distance: 14, windSpeed: 4,windDirection: 310,temperature: 1,weatherType: WeatherType.raining,windIconColor: "3971FF"),
  Location(id: 5, locationName: 'Castricum aan Zee', adres: 'Strand, 1901 NZ Castricum', distance: 4, windSpeed: 12,windDirection: 90,temperature: 5,weatherType: WeatherType.raining,windIconColor: "76E648"),
  Location(id: 6, locationName: 'Bloemendaal aan Zee', adres: 'Strand, 151 TS Bloemendaal', distance: 14, windSpeed: 8,windDirection: 45,temperature: 7,weatherType: WeatherType.raining,windIconColor: "F09D0A"),
  Location(id: 7, locationName: 'Strand Wijk aan Zee', adres: 'Strand, 1901 NZ Bloemendaal', distance: 7, windSpeed: 1,windDirection: 185,temperature: 32,weatherType: WeatherType.raining,windIconColor: "DEDEDE"),
  Location(id: 8, locationName: 'Egmond aan Zee', adres: 'Strand, 1486 AZ Egmond', distance: 14, windSpeed: 4,windDirection: 310,temperature: 1,weatherType: WeatherType.raining,windIconColor: "3971FF"),
  Location(id: 9, locationName: 'Castricum aan Zee', adres: 'Strand, 1901 NZ Castricum', distance: 4, windSpeed: 12,windDirection: 90,temperature: 5,weatherType: WeatherType.raining,windIconColor: "76E648"),
  Location(id: 10, locationName: 'Bloemendaal aan Zee', adres: 'Strand, 151 TS Bloemendaal', distance: 14, windSpeed: 8,windDirection: 45,temperature: 7,weatherType: WeatherType.raining,windIconColor: "F09D0A"),
  Location(id: 11, locationName: 'Strand Wijk aan Zee', adres: 'Strand, 1901 NZ Bloemendaal', distance: 7, windSpeed: 1,windDirection: 185,temperature: 32,weatherType: WeatherType.raining,windIconColor: "DEDEDE"),
  Location(id: 12, locationName: 'Egmond aan Zee', adres: 'Strand, 1486 AZ Egmond', distance: 14, windSpeed: 4,windDirection: 310,temperature: 1,weatherType: WeatherType.raining,windIconColor: "3971FF"),
  Location(id: 13, locationName: 'Castricum aan Zee', adres: 'Strand, 1901 NZ Castricum', distance: 4, windSpeed: 12,windDirection: 90,temperature: 5,weatherType: WeatherType.raining,windIconColor: "76E648"),
  Location(id: 14, locationName: 'Bloemendaal aan Zee', adres: 'Strand, 151 TS Bloemendaal', distance: 14, windSpeed: 8,windDirection: 45,temperature: 7,weatherType: WeatherType.raining,windIconColor: "F09D0A"),
  Location(id: 15, locationName: 'Strand Wijk aan Zee', adres: 'Strand, 1901 NZ Bloemendaal', distance: 7, windSpeed: 1,windDirection: 185,temperature: 32,weatherType: WeatherType.raining,windIconColor: "DEDEDE"),
  Location(id: 16, locationName: 'Egmond aan Zee', adres: 'Strand, 1486 AZ Egmond', distance: 14, windSpeed: 4,windDirection: 310,temperature: 1,weatherType: WeatherType.raining,windIconColor: "3971FF"),
];
