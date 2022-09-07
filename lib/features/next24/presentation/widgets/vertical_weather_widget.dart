import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/models/weather_data_model.dart';
import 'package:weather_app/core/utils/constants.dart';

class VerticalWeatherWidget extends StatelessWidget {
  const VerticalWeatherWidget(
      {Key? key, required this.index, required this.dataModel})
      : super(key: key);
  final int index;
  final WeatherDataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index == 0 ? Colors.black26 : Colors.transparent,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              index == 0
                  ? 'Now'
                  : DateFormat('HH:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(
                              dataModel.dateTime! * 1000)
                          .subtract(const Duration(hours: 2))),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              getWeatherIcon(dataModel.weatherModels![0].id!),
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              '${dataModel.weatherDetailsModel!.minTemp} °',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Lottie.asset(
              'assets/lotties/humidity.json',
              height: 40,
              width: 40,
            ),
            Text(
              '${dataModel.weatherDetailsModel!.humidity}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Lottie.asset(
              'assets/lotties/wind.json',
              height: 40,
              width: 30,
            ),
            Text(
              '${dataModel.windSpeed}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
