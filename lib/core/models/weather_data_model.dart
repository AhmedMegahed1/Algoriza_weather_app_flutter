import 'package:weather_app/core/models/weather_details_model.dart';
import 'package:weather_app/core/models/weather_model.dart';

class WeatherDataModel {
  WeatherDetailsModel? weatherDetailsModel;
  List<WeatherModel>? weatherModels;
  int? dateTime;
  dynamic windSpeed;

  WeatherDataModel.fromJson(Map<String, dynamic> json) {
    weatherDetailsModel = WeatherDetailsModel.fromJson(json['main']);
    if (json['weather'] != null) {
      weatherModels = <WeatherModel>[];
      for (var element in json['weather']) {
        weatherModels!.add(WeatherModel.fromJson(element));
      }
    }
    dateTime = json['dt'] ?? 0;
    windSpeed = json['wind']['speed'] ?? 0;
  }
}
