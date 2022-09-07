class CoordinatesModel {
  double? latitude;
  double? longitude;

  CoordinatesModel.fromJson(Map<String, dynamic> json) {
    latitude = json['lat'] ?? 0.0;
    longitude = json['long'] ?? 0.0;
  }
}