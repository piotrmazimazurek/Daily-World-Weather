class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.city,
    required this.airquality,
  });

  final double temperature;
  final String city;
  final String airquality;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : temperature = json['current']['temp_c'] + 0.0,
        city = json['location']['name'],
        airquality = json['current']['air_quality'];
}
