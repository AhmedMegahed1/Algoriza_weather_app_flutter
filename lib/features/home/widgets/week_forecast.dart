import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/features/home/presentation/widgets/day_weather_widget.dart';

class WeekForecastWidget extends StatelessWidget {
  const WeekForecastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(
            0.4,
          ),
        ),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white.withOpacity(
          0.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DayWeatherWidget(
              day: DateTime.now(),
              humidity: cubit.fiveDaysWeather[0].humidity,
              minDegree: cubit.fiveDaysWeather[0].minTemp,
              maxDegree: cubit.fiveDaysWeather[0].maxTemp,
            ),
            DayWeatherWidget(
              day: DateTime.now().add(
                const Duration(
                  days: 1,
                ),
              ),
              humidity: cubit.fiveDaysWeather[1].humidity,
              minDegree: cubit.fiveDaysWeather[1].minTemp,
              maxDegree: cubit.fiveDaysWeather[1].maxTemp,
            ),
            DayWeatherWidget(
              day: DateTime.now().add(
                const Duration(
                  days: 2,
                ),
              ),
              humidity: cubit.fiveDaysWeather[2].humidity,
              minDegree: cubit.fiveDaysWeather[2].minTemp,
              maxDegree: cubit.fiveDaysWeather[2].maxTemp,
            ),
            DayWeatherWidget(
              day: DateTime.now().add(
                const Duration(
                  days: 3,
                ),
              ),
              humidity: cubit.fiveDaysWeather[3].humidity,
              minDegree: cubit.fiveDaysWeather[3].minTemp,
              maxDegree: cubit.fiveDaysWeather[3].maxTemp,
            ),
            DayWeatherWidget(
              day: DateTime.now().add(
                const Duration(
                  days: 4,
                ),
              ),
              humidity: cubit.fiveDaysWeather[4].humidity,
              minDegree: cubit.fiveDaysWeather[4].minTemp,
              maxDegree: cubit.fiveDaysWeather[4].maxTemp,
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
