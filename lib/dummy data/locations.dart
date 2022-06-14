import 'dart:math';

import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:kiteup/helpers/hexcolor.dart';

enum WeatherType { sunny, raining, cloudy }

class Location {
  final int? id;
  final String locationName;
  final String adres;
  final num? distance;
  final num windSpeed;
  final num windDirection;
  final String windIconColor;
  final num temperature;
  final WeatherType? weatherType;
  TimeOfDay? arrivalTime;

  bool isLiked;

  Location(
      {required this.id,
      required this.locationName,
      required this.adres,
      required this.windSpeed,
      required this.windDirection,
      required this.temperature,
      required this.weatherType,
      required this.windIconColor,
      this.distance,
      required this.isLiked});

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        locationName = json['locationName'],
        adres = json['adres'],
        distance = json['distance'],
        windSpeed = json['windSpeed'],
        windDirection = json['windDirection'],
        windIconColor = json['windIconColor'],
        temperature = json['temperature'],
        isLiked = json['isLiked'],
        weatherType = WeatherType.values.byName(json['weatherType']),
        arrivalTime = TimeOfDay(
          hour: json['arrivalTime']['hour'],
          minute: json['arrivalTime']['minute'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'locationName': locationName,
      'adres': adres,
      'distance': distance,
      'windSpeed': windSpeed,
      'windDirection': windDirection,
      'windIconColor': windIconColor,
      'temperature': temperature,
      'isLiked': isLiked,
      'weatherType': weatherType?.name,
      'arrivalTime': {
        'hour': arrivalTime?.hour,
        'minute': arrivalTime?.minute,
      },
    };
  }

  @override
  String toString() {
    return 'Location{locationName: $locationName, adres: $adres, distance: $distance, windSpeed: $windSpeed, windDirection: $windDirection, windIconColor: $windIconColor, temperature: $temperature, weatherType: $weatherType, arrivalTime: $arrivalTime}';
  }
}

var allLocations = [
  Location(
      id: 1,
      locationName: 'Castricum aan Zee',
      adres: 'Strand, 1901 NZ Castricum',
      distance: 4,
      windSpeed: 12,
      windDirection: 90,
      temperature: 5,
      weatherType: WeatherType.raining,
      windIconColor: "76E648",
      isLiked: false),
  Location(
      id: 2,
      locationName: 'Bloemendaal aan Zee',
      adres: 'Strand, 151 TS Bloemendaal',
      distance: 14,
      windSpeed: 8,
      windDirection: 45,
      temperature: 7,
      weatherType: WeatherType.cloudy,
      windIconColor: "F09D0A",
      isLiked: false),
  Location(
      id: 3,
      locationName: 'Strand Wijk aan Zee',
      adres: 'Strand, 1901 NZ Bloemendaal',
      distance: 7,
      windSpeed: 1,
      windDirection: 185,
      temperature: 32,
      weatherType: WeatherType.sunny,
      windIconColor: "DEDEDE",
      isLiked: false),
  Location(
      id: 4,
      locationName: 'Egmond aan Zee',
      adres: 'Strand, 1486 AZ Egmond',
      distance: 14,
      windSpeed: 4,
      windDirection: 310,
      temperature: 1,
      weatherType: WeatherType.cloudy,
      windIconColor: "3971FF",
      isLiked: false),
];
