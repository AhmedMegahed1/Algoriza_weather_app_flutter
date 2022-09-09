import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/feature2/home/widgets/locationNow.dart';
import 'package:weather_app/feature2/home/widgets/text_button.dart';

import 'package:weather_app/features1/manage_locations/pages/manage_locations_page.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 20, 3, 95),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 16.0,
            right: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                LocationNow(
                  locationName:
                      '${AppCubit.get(context).dataModel.cityModel!.name}',
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Divider(
                  thickness: 2,
                  indent: 4,
                  endIndent: 4,
                  color: Colors.white,
                  height: 20,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.add_location_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 32.0,
                    ),
                    Text(
                      'Other locations',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                if (AppCubit.get(context).favouriteLocations.isNotEmpty)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return LocationNow(
                          locationName:
                              AppCubit.get(context).favouriteLocations[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8.0,
                      );
                    },
                    itemCount: AppCubit.get(context).favouriteLocations.length,
                  ),
                const SizedBox(
                  height: 16.0,
                ),
                TexttButton(
                  height: 45,
                  onPressed: () {
                    navigate(context: context, page: ManageLocationsPage());
                  },
                  text: 'Manage locations',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Divider(
                  thickness: 2,
                  indent: 4,
                  endIndent: 4,
                  color: Colors.white,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
