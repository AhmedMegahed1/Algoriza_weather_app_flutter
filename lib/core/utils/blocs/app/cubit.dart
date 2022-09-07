import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/data/local/local.dart';
import 'package:weather_app/core/data/remote/dio_helper.dart';
import 'package:weather_app/core/models/data_model.dart';
import 'package:weather_app/core/models/weather_details_model.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/core/utils/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  late DataModel dataModel;

  late List<WeatherDetailsModel> fiveDaysWeather;

  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(GetLocationPermissionErrorState(
            error: "Location permission are denied"));
      } else if (permission == LocationPermission.deniedForever) {
        emit(GetLocationPermissionErrorState(
            error: "Location permission are permanently denied"));
      } else {
        emit(GetLocationPermissionSuccessState());
      }
    } else {
      GetLocationPermissionSuccessState();
    }
  }

  Future<void> getCurrentLocationData() async {
    emit(GetCurrentLocationDataLoadingState());
    await checkLocationPermission().then((value) async {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((value) {
        getData(value.latitude, value.longitude);
        emit(GetCurrentLocationDataSuccessState());
      }).catchError((error) {
        emit(GetCurrentLocationDataErrorState(error: error.toString()));
      });
    });
  }

  Future<void> getData(double latitude, double longitude) async {
    emit(GetDataLoadingState());
    await DioHelper.getData(url: 'data/2.5/forecast/', query: {
      "lat": "$latitude",
      "lon": "$longitude",
      "appid": apiKey,
      "units": "metric",
    }).then((value) {
      dataModel = DataModel.fromJson(value.data);

      fiveDaysWeather = [
        dataModel.weatherDataModels![0].weatherDetailsModel!,
        dataModel.weatherDataModels![0 + 8].weatherDetailsModel!,
        dataModel.weatherDataModels![0 + 16].weatherDetailsModel!,
        dataModel.weatherDataModels![0 + 24].weatherDetailsModel!,
        dataModel.weatherDataModels![0 + 32].weatherDetailsModel!,
      ];

      emit(GetDataSuccessState());
    }).catchError((error) {
      emit(GetDataErrorState(error: error.toString()));
      debugPrint(error.toString());
    });
  }

  late DataModel cityDataModel;

  late List<WeatherDetailsModel> cityFiveDaysForecast;

  Future<void> getCityData({required String city}) async {
    emit(GetSearchDataLoadingState());
    await DioHelper.getData(
        url: 'data/2.5/forecast/',
        query: {"q": city, "appid": apiKey, "units": "metric"}).then((value) {
      cityDataModel = DataModel.fromJson(value.data);

      cityFiveDaysForecast = [
        cityDataModel.weatherDataModels![0].weatherDetailsModel!,
        cityDataModel.weatherDataModels![0 + 8].weatherDetailsModel!,
        cityDataModel.weatherDataModels![0 + 16].weatherDetailsModel!,
        cityDataModel.weatherDataModels![0 + 24].weatherDetailsModel!,
        cityDataModel.weatherDataModels![0 + 32].weatherDetailsModel!,
      ];
      emit(GetSearchDataSuccessState());
      emit(GetDataSuccessState());
    }).catchError((error) {
      emit(GetSearchDataErrorState(error: error.toString()));
      emit(GetDataSuccessState());
    });
  }

  Future<void> chooseLocation({required String city}) async {
    await getCityData(city: city).then((value) {
      dataModel = cityDataModel;

      fiveDaysWeather = cityFiveDaysForecast;
      emit(ChooseLocationSuccessState());
      emit(GetDataSuccessState());
    });
  }

  List<String> favouriteLocations = [];

  void getFavouriteLocations() async {
    favouriteLocations = await Local.getData('favourites');
    emit(GetFavouriteLocationsSuccessState());
  }

  Future<void> addCityToFavourite({required String city}) async {
    favouriteLocations.add(city);
    await Local.putData(key: 'favourites', value: favouriteLocations);
    emit(AddCityToFavouriteSuccessState());
    emit(GetDataSuccessState());
  }

  void removeCityFromFavourites({required int index}) async {
    favouriteLocations.removeAt(index);
    await Local.putData(key: 'favourites', value: favouriteLocations);
    emit(RemoveCityFromFavouritesSuccessState());
    emit(GetDataSuccessState());
  }
}
