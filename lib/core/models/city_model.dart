import 'package:weather_app/core/models/coordinates_model.dart';

class CityModel {
  String? name;
  CoordinatesModel? coordinates;
  String? country;
  int? population;
  int? sunrise;
  int? sunset;

  CityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    coordinates = CoordinatesModel.fromJson(json['coord']);
    country = json['country'] ?? '';
    population = json['population'] ?? 0;
    sunrise = json['sunrise'] ?? 0;
    sunset = json['sunset'] ?? 0;
  }
}