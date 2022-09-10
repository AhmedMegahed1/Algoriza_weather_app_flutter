import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/core/utils/load_page.dart';
import 'package:weather_app/feature2/home/pages/home1.dart';
import 'package:weather_app/feature2/home/widgets/drawer.dart';
import 'package:weather_app/feature2/home/widgets/week_forecast.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final String asset = DateTime.now().hour < 19
      ? "assets/lotties/day.json"
      : "assets/lotties/night.json";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        if (state is! GetDataSuccessState) {
          return const LoadPage();
        } else {
          return Scaffold(
            drawer: const Drawerr(),
            backgroundColor: const Color.fromARGB(255, 20, 3, 95),
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    backgroundColor: Colors.black,
                    expandedHeight: MediaQuery.of(context).size.height,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Home1(),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(
                            16.0,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${cubit.dataModel.cityModel!.name}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24.0,
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
                              Row(
                                children: [
                                  Text(
                                    '${cubit.dataModel.weatherDataModels![0].weatherDetailsModel!.temp} °',
                                    style: const TextStyle(
                                      fontSize: 64.0,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${cubit.dataModel.weatherDataModels![0].weatherDetailsModel!.minTemp}° / ${cubit.dataModel.weatherDataModels![0].weatherDetailsModel!.maxTemp}°',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('EE, hh:mm a')
                                            .format(DateTime.now()),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Lottie.asset(
                                    asset,
                                    height: 50,
                                    width: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const WeekForecast(),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Container(
                                width: double.infinity,
                                height: 200,
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
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Sunrise',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            DateFormat('h:m a').format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      cubit.dataModel.cityModel!
                                                              .sunrise! *
                                                          1000),
                                            ),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          Lottie.asset(
                                            "assets/lotties/sunrise.json",
                                            width: 100,
                                            height: 100.0,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          const Text(
                                            'Sunset',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            DateFormat('h:m a').format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      cubit.dataModel.cityModel!
                                                              .sunset! *
                                                          1000),
                                            ),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          Lottie.asset(
                                            "assets/lotties/sunset.json",
                                            width: 100,
                                            height: 100.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Container(
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
                                  padding: const EdgeInsets.all(
                                    16.0,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Lottie.asset(
                                            'assets/lotties/uv.json',
                                            height: 50,
                                            width: 50,
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          const Text(
                                            "UV index",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          const Text(
                                            'High',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Lottie.asset(
                                            'assets/lotties/wind.json',
                                            height: 50,
                                            width: 50,
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          const Text(
                                            "Wind",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Text(
                                            '${cubit.dataModel.weatherDataModels![0].windSpeed} Km/h',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Lottie.asset(
                                            'assets/lotties/humidity.json',
                                            height: 50,
                                            width: 50,
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          const Text(
                                            "Humidity",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Text(
                                            '${cubit.dataModel.weatherDataModels![0].weatherDetailsModel!.humidity!}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 150,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
