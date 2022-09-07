import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_chart_widget.dart';

class HomeFrontPage extends StatelessWidget {
  HomeFrontPage({Key? key}) : super(key: key);

  final String asset = DateTime.now().hour < 18 && DateTime.now().hour > 6
      ? "assets/lotties/day.json"
      : "assets/lotties/night.json";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 20, 3, 95),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: state is GetCurrentLocationDataLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${cubit.dataModel.weatherDataModels![0].weatherDetailsModel!.temp} °',
                              style: const TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Lottie.asset(
                              asset,
                              height: 100,
                              width: 100,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '${cubit.dataModel.cityModel!.name}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Icon(
                              Icons.location_pin,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${cubit.dataModel.weatherDataModels![0].weatherDetailsModel!.minTemp}° / ${cubit.dataModel.weatherDataModels![0].weatherDetailsModel!.maxTemp}° Feels like ${cubit.dataModel.weatherDataModels![0].weatherDetailsModel!.feelsLike}°',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          DateFormat('EE, hh:mm a').format(DateTime.now()),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        const WeatherChart(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          height: 80,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Today\'s Temperature',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  '${cubit.dataModel.weatherDataModels![0].weatherModels![0].description}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
