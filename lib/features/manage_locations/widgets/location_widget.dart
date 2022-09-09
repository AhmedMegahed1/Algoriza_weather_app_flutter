import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/home/presentation/pages/home.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
    required this.cityName,
    required this.isCurrentLocation,
    required this.minDegree,
    required this.maxDegree,
    required this.index,
    required this.currentDegree,
  }) : super(key: key);
  final String cityName;
  final bool isCurrentLocation;
  final int minDegree;
  final int maxDegree;
  final int index;
  final int currentDegree;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 184, 166, 8),
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      child: ListTile(
        onTap: () {
          if (isCurrentLocation) {
            AppCubit.get(context).getCurrentLocationData().then((value) {
              navigate(context: context, page: HomePage());
            });
          } else {
            AppCubit.get(context)
                .chooseLocation(
                    city: AppCubit.get(context).favouriteLocations[index])
                .then((value) {
              navigate(context: context, page: HomePage());
            });
          }
        },
        title: Row(
          children: [
            Text(
              cityName,
              style: const TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            if (isCurrentLocation)
              const Icon(
                Icons.location_pin,
                color: Colors.white,
                size: 18.0,
              )
          ],
        ),
        subtitle: isCurrentLocation
            ? Text(
                '${AppCubit.get(context).dataModel.weatherDataModels![0].weatherDetailsModel!.minTemp}° / ${AppCubit.get(context).dataModel.weatherDataModels![0].weatherDetailsModel!.maxTemp}°',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              )
            : const SizedBox(),
        trailing: isCurrentLocation
            ? const SizedBox()
            : IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  AppCubit.get(context).removeCityFromFavourites(index: index);
                },
              ),
      ),
    );
  }
}
