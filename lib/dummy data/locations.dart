enum WeatherType{
  sunny,
  raining
}

class Location{
  final String locationName;
  final String adres;
  final num distance;
  final num windSpeed;
  final num windDirection;
  final num temperature;
  final WeatherType weatherType;

  const Location({
    required this.locationName,
    required this.adres,
    required this.distance,
    required this.windSpeed,
    required this.windDirection,
    required this.temperature,
    required this.weatherType
  });
}

const allLocations = [
  Location(locationName: 'Castricum aan zee', adres: 'Strand, 1901 NZ Castricum', distance: 4, windSpeed: 12,windDirection: 90,temperature: 5,weatherType: WeatherType.raining),
  Location(locationName: 'Bloemendaal aan zee', adres: 'Strand, 1901 NZ Bloemendaal', distance: 14, windSpeed: 8,windDirection: 45,temperature: 7,weatherType: WeatherType.raining)
];