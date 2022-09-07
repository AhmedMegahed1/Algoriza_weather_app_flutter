
import 'package:weather_app/core/utils/constants.dart';

class WeatherDetailsModel {
  dynamic temp;
  dynamic feelsLike;
  dynamic minTemp;
  dynamic maxTemp;
  int? humidity;

  WeatherDetailsModel.fromJson(Map<String, dynamic> json) {
    temp = round(json['temp'] ?? 0.0);
    feelsLike = round(json['feels_like'] ?? 0.0);
    minTemp = round(json['temp_min'] ?? 0.0);
    maxTemp = round(json['temp_max'] ?? 0.0);
    humidity = json['humidity'] ?? 0;
  }
}