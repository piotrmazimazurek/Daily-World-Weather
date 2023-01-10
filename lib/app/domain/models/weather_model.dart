// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names

class WeatherModel {
  const WeatherModel(
      {required this.icon_url,
      required this.temperature,
      required this.city,
      required this.condition,
      required this.pressure});

  final String icon_url;
  final double temperature;
  final String city;
  final String condition;
  final double pressure;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : icon_url = "http:" + json['current']['condition']['icon'],
        temperature = json['current']['temp_c'] + 0.0,
        city = json['location']['name'],
        condition = json['current']['condition']['text'],
        pressure = json['current']['pressure_mb'];
}
