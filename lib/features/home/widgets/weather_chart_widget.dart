import 'package:flutter/material.dart';
import 'package:tiny_charts/tiny_charts.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/home/presentation/widgets/text_button.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_hour.dart';

import '../../../next24/presentation/pages/Next_24houre.dart';

class WeatherChart extends StatelessWidget {
  const WeatherChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    return Container(
      height: 225,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(
            0.7,
          ),
        ),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white.withOpacity(
          0.1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WeatherHour(
                    data: cubit.dataModel.weatherDataModels![0],
                  ),
                  WeatherHour(
                    data: cubit.dataModel.weatherDataModels![1],
                  ),
                  WeatherHour(
                    data: cubit.dataModel.weatherDataModels![2],
                  ),
                  WeatherHour(
                    data: cubit.dataModel.weatherDataModels![3],
                  ),
                  WeatherHour(
                    data: cubit.dataModel.weatherDataModels![4],
                  ),
                  WeatherHour(
                    data: cubit.dataModel.weatherDataModels![5],
                  ),
                  WeatherHour(
                    data: cubit.dataModel.weatherDataModels![6],
                  ),
                  WeatherHour(
                    data: cubit.dataModel.weatherDataModels![7],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TinyLineChart(
              width: double.infinity,
              height: 50,
              dataPoints: [
                Offset(
                  0,
                  double.parse(
                    '${cubit.dataModel.weatherDataModels![0].weatherDetailsModel!.temp}',
                  ),
                ),
                Offset(
                  1,
                  double.parse(
                    '${cubit.dataModel.weatherDataModels![1].weatherDetailsModel!.temp}',
                  ),
                ),
                Offset(
                  2,
                  double.parse(
                    '${cubit.dataModel.weatherDataModels![2].weatherDetailsModel!.temp}',
                  ),
                ),
                Offset(
                  3,
                  double.parse(
                    '${cubit.dataModel.weatherDataModels![3].weatherDetailsModel!.temp}',
                  ),
                ),
                Offset(
                  4,
                  double.parse(
                    '${cubit.dataModel.weatherDataModels![4].weatherDetailsModel!.temp}',
                  ),
                ),
                Offset(
                  5,
                  double.parse(
                    '${cubit.dataModel.weatherDataModels![5].weatherDetailsModel!.temp}',
                  ),
                ),
                Offset(
                  6,
                  double.parse(
                    '${cubit.dataModel.weatherDataModels![6].weatherDetailsModel!.temp}',
                  ),
                ),
                Offset(
                  7,
                  double.parse(
                    '${cubit.dataModel.weatherDataModels![7].weatherDetailsModel!.temp}',
                  ),
                ),
              ],
              options: const TinyLineChartOptions(
                color: Colors.white,
                lineWidth: 2,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TexttButton(
              onPressed: () {
                navigate(context: context, page: const NextHour());
              },
              text: 'Show Next 24-Hours',
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
