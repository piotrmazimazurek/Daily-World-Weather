class WeatherModel {
  const WeatherModel(
      {required this.icon,
      required this.temperature,
      required this.city,
      required this.condition,
      required this.airquality});

  final String icon;
  final double temperature;
  final String city;
  final String condition;
  final int airquality;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : icon = json['current']['condition']['code'],
        temperature = json['current']['temp_c'] + 0.0,
        city = json['location']['name'],
        condition = json['current']['condition']['text'],
        airquality = json['current']['air_quality']['us-epa-index'];
}
