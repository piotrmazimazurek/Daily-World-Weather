class WeatherModel {
  const WeatherModel(
      {required this.temperature,
      required this.city,
      required this.air_quality});

  final double temperature;
  final String city;
  final String air_quality;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : temperature = json['current']['temp.c'] + 0.0,
        city = json['location']['name'],
        air_quality = json['current']['air_quality'];
}
