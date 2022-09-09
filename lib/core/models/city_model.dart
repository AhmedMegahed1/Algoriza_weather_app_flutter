import 'package:weather_app/core/models/coordinate_model.dart';

class CityModel {
  String? name;
  CoordinateModel? coordinates;
  String? country;
  int? population;
  int? sunrise;
  int? sunset;

  CityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    coordinates = CoordinateModel.fromJson(json['coord']);
    country = json['country'] ?? '';
    population = json['population'] ?? 0;
    sunrise = json['sunrise'] ?? 0;
    sunset = json['sunset'] ?? 0;
  }
}