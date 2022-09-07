class WeatherModel {
  String? main;
  int? id;
  String? description;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    id = json['id'];
    description = json['description'];
  }
}
