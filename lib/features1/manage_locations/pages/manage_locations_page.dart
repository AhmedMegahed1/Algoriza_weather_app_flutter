import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features1/manage_locations/widgets/location_widget.dart';
import 'package:weather_app/features1/manage_locations/widgets/show_bottom_sheet.dart';


class ManageLocationsPage extends StatelessWidget {
  ManageLocationsPage({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 3, 95),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 3, 95),
        elevation: 0.0,
        title: const Text(
          'Manage Locations',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            if (state is GetSearchDataSuccessState) {
              Scaffold.of(context).showBottomSheet(
                  backgroundColor: const Color.fromARGB(255, 20, 3, 95),
                  (context) {
                return const ShowBottomSheet();
              });
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    autofocus: false,
                    controller: searchController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 20, 3, 95),
                        ),
                        borderRadius: BorderRadius.circular(
                          35.0,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: TextButton(
                        child: const Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          AppCubit.get(context)
                              .getCityData(city: searchController.text);
                        },
                      ),
                      hintText: 'Enter location',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 20, 3, 95),
                        ),
                        borderRadius: BorderRadius.circular(
                          35.0,
                        ),
                      ),
                      fillColor: Colors.black26,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  LocationWidget(
                    index: 0,
                    cityName:
                        '${AppCubit.get(context).dataModel.cityModel!.name}',
                    isCurrentLocation: true,
                    minDegree: 35,
                    maxDegree: 39,
                    currentDegree: 36,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  if (AppCubit.get(context).favouriteLocations.isNotEmpty)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return LocationWidget(
                          cityName:
                              AppCubit.get(context).favouriteLocations[index],
                          isCurrentLocation: false,
                          minDegree: 0,
                          maxDegree: 0,
                          currentDegree: 0,
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 16.0,
                        );
                      },
                      itemCount:
                          AppCubit.get(context).favouriteLocations.length,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
