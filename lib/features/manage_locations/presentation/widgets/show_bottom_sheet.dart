import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return Container(
          height: 120.0,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 174, 169, 197),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                25.0,
              ),
              topRight: Radius.circular(
                30.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Material(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(
                      "${cubit.cityDataModel.cityModel!.name}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      "${cubit.cityDataModel.cityModel!.country}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        AppCubit.get(context)
                            .addCityToFavourite(
                                city: AppCubit.get(context)
                                    .cityDataModel
                                    .cityModel!
                                    .name!)
                            .then((value) {
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
