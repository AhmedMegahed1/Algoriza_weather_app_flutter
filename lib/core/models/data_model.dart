import 'package:weather_app/core/models/city_model.dart';
import 'package:weather_app/core/models/weather_data_model.dart';

class DataModel {
  List<WeatherDataModel>? weatherDataModels;
  CityModel? cityModel;

  DataModel.fromJson(Map<String, dynamic> data) {
    weatherDataModels = <WeatherDataModel>[];
    if (data['list'] != null) {
      weatherDataModels = <WeatherDataModel>[];
      for (var element in data['list']) {
        weatherDataModels!.add(WeatherDataModel.fromJson(element));
      }
      cityModel = CityModel.fromJson(data['city']);
    }
  }
}
