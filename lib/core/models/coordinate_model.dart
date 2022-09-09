class CoordinateModel {
  double? latitude;
  double? longitude;

  CoordinateModel.fromJson(Map<String, dynamic> json) {
    latitude = json['lat'] ?? 0.0;
    longitude = json['long'] ?? 0.0;
  }
}