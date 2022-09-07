abstract class AppStates {}

class AppInitialState extends AppStates {}

class GetDataLoadingState extends AppStates {}

class GetDataSuccessState extends AppStates {}

class GetDataErrorState extends AppStates {
  GetDataErrorState({required this.error});

  final String error;
}

class GetLocationPermissionSuccessState extends AppStates {}

class GetLocationPermissionErrorState extends AppStates {
  GetLocationPermissionErrorState({required this.error});

  final String error;
}

class GetCurrentLocationDataLoadingState extends AppStates {}

class GetCurrentLocationDataSuccessState extends AppStates {}

class GetCurrentLocationDataErrorState extends AppStates {
  GetCurrentLocationDataErrorState({required this.error});

  final String error;
}

class GetSearchDataSuccessState extends AppStates {}

class GetSearchDataLoadingState extends AppStates {}

class GetSearchDataErrorState extends AppStates {
  GetSearchDataErrorState({required this.error});

  final String error;
}

class AddCityToFavouriteSuccessState extends AppStates {}

class GetFavouriteLocationsSuccessState extends AppStates {}

class RemoveCityFromFavouritesSuccessState extends AppStates {}

class ChooseLocationSuccessState extends AppStates {}
