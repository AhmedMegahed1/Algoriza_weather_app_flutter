import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/models/weather_data_model.dart';
import 'package:weather_app/core/utils/constants.dart';

class WeatherHour extends StatelessWidget {
  const WeatherHour({Key? key, required this.data}) : super(key: key);

  final WeatherDataModel data;

  @override
  Widget build(BuildContext context) {
    String formatTime = DateFormat('h:mm a').format(
        DateTime.fromMillisecondsSinceEpoch(data.dateTime! * 1000)
            .subtract(const Duration(hours: 2)));
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Column(
        children: [
          Text(
            formatTime,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            getWeatherIcon(data.weatherModels![0].id!),
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.yellow,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "${data.weatherDetailsModel!.temp} °",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
