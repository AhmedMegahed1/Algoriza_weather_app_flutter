import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/home/presentation/widgets/humidity_widget.dart';

class DayWeatherWidget extends StatelessWidget {
  const DayWeatherWidget({
    Key? key,
    required this.day,
    required this.humidity,
    required this.minDegree,
    required this.maxDegree,
  }) : super(key: key);
  final DateTime day;
  final int? humidity;
  final dynamic minDegree;
  final dynamic maxDegree;

  @override
  Widget build(BuildContext context) {
    String dayString = day.day == DateTime.now().day
        ? 'Today'
        : DateFormat('EEEE').format(day);
    return Row(
      children: [
        Text(
          dayString,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
        const Spacer(),
        HumidityWidget(
          value: humidity,
        ),
        const SizedBox(
          width: 16.0,
        ),
        const Icon(
          Icons.circle,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 16.0,
        ),
        const Icon(
          Icons.nights_stay,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 16.0,
        ),
        Text(
          '$minDegree °',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Text(
          '$maxDegree °',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
