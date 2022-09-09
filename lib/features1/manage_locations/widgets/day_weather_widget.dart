import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/constants.dart';

class VerticalDayWeatherWidget extends StatelessWidget {
  final DateTime day;
  final int id;
  final int minDegree;
  final int maxDegree;
  const VerticalDayWeatherWidget({
    Key? key,
    required this.day,
    required this.id,
    required this.minDegree,
    required this.maxDegree,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat('EE').format(day),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          getWeatherIcon(id),
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          '$minDegree°',
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          '$maxDegree°',
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
