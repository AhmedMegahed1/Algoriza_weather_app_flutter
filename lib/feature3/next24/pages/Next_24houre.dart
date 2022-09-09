// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';

import '../widgets/weather_widget.dart';


class NextHour extends StatelessWidget {
  const NextHour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 3, 95),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 3, 95),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return WeatherWidget(
                      index: index,
                      dataModel: AppCubit.get(context)
                          .dataModel
                          .weatherDataModels![index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 5.0,
                  );
                },
                itemCount: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
